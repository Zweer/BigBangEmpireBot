package websocket.hurlant.crypto.cert
{
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.hash.IHash;
   import websocket.hurlant.crypto.hash.MD2;
   import websocket.hurlant.crypto.hash.MD5;
   import websocket.hurlant.crypto.hash.SHA1;
   import websocket.hurlant.crypto.rsa.RSAKey;
   import websocket.hurlant.util.ArrayUtil;
   import websocket.hurlant.util.Base64;
   import websocket.hurlant.util.der.ByteString;
   import websocket.hurlant.util.der.DER;
   import websocket.hurlant.util.der.ObjectIdentifier;
   import websocket.hurlant.util.der.PEM;
   import websocket.hurlant.util.der.PrintableString;
   import websocket.hurlant.util.der.Sequence;
   import websocket.hurlant.util.der.Type;
   
   public class X509Certificate
   {
       
      
      private var _loaded:Boolean;
      
      private var _param;
      
      private var _obj:Object;
      
      public function X509Certificate(param1:*)
      {
         super();
         _loaded = false;
         _param = param1;
      }
      
      private function load() : void
      {
         var _loc2_:* = null;
         if(_loaded)
         {
            return;
         }
         var _loc1_:* = _param;
         if(_loc1_ is String)
         {
            _loc2_ = PEM.readCertIntoArray(_loc1_ as String);
         }
         else if(_loc1_ is ByteArray)
         {
            _loc2_ = _loc1_;
         }
         if(_loc2_ != null)
         {
            _obj = DER.parse(_loc2_,Type.TLS_CERT);
            _loaded = true;
            return;
         }
         throw new Error("Invalid x509 Certificate parameter: " + _loc1_);
      }
      
      public function isSigned(param1:X509CertificateCollection, param2:X509CertificateCollection, param3:Date = null) : Boolean
      {
         load();
         if(param3 == null)
         {
            param3 = new Date();
         }
         var _loc8_:Date = getNotBefore();
         var _loc5_:Date = getNotAfter();
         if(param3.getTime() < _loc8_.getTime())
         {
            return false;
         }
         if(param3.getTime() > _loc5_.getTime())
         {
            return false;
         }
         var _loc6_:String = getIssuerPrincipal();
         var _loc4_:X509Certificate = param2.getCertificate(_loc6_);
         var _loc7_:Boolean = false;
         if(_loc4_ == null)
         {
            _loc4_ = param1.getCertificate(_loc6_);
            if(_loc4_ == null)
            {
               return false;
            }
         }
         else
         {
            _loc7_ = true;
         }
         if(_loc4_ == this)
         {
            return false;
         }
         if(!(_loc7_ && _loc4_.isSelfSigned(param3)) && !_loc4_.isSigned(param1,param2,param3))
         {
            return false;
         }
         var _loc9_:RSAKey = _loc4_.getPublicKey();
         return verifyCertificate(_loc9_);
      }
      
      public function isSelfSigned(param1:Date) : Boolean
      {
         load();
         var _loc2_:RSAKey = getPublicKey();
         return verifyCertificate(_loc2_);
      }
      
      private function verifyCertificate(param1:RSAKey) : Boolean
      {
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc6_:String = getAlgorithmIdentifier();
         var _loc8_:* = _loc6_;
         switch(_loc8_)
         {
            case "1.2.840.113549.1.1.5":
               _loc7_ = new SHA1();
               _loc5_ = "1.3.14.3.2.26";
               break;
            case "1.2.840.113549.1.1.2":
               _loc7_ = new MD2();
               _loc5_ = "1.2.840.113549.2.2";
               break;
            case "1.2.840.113549.1.1.4":
               _loc7_ = new MD5();
               _loc5_ = "1.2.840.113549.2.5";
               break;
            default:
               return false;
         }
         var _loc3_:ByteArray = _obj.signedCertificate_bin;
         var _loc2_:ByteArray = new ByteArray();
         param1.verify(_obj.encrypted,_loc2_,_obj.encrypted.length);
         _loc2_.position = 0;
         _loc3_ = _loc7_.hash(_loc3_);
         var _loc4_:Object = DER.parse(_loc2_,Type.RSA_SIGNATURE);
         if(_loc4_.algorithm.algorithmId.toString() != _loc5_)
         {
            return false;
         }
         if(!ArrayUtil.equals(_loc4_.hash,_loc3_))
         {
            return false;
         }
         return true;
      }
      
      private function signCertificate(param1:RSAKey, param2:String) : ByteArray
      {
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = param2;
         switch(_loc8_)
         {
            case "1.2.840.113549.1.1.5":
               _loc7_ = new SHA1();
               _loc6_ = "1.3.14.3.2.26";
               break;
            case "1.2.840.113549.1.1.2":
               _loc7_ = new MD2();
               _loc6_ = "1.2.840.113549.2.2";
               break;
            case "1.2.840.113549.1.1.4":
               _loc7_ = new MD5();
               _loc6_ = "1.2.840.113549.2.5";
               break;
            default:
               return null;
         }
         var _loc4_:ByteArray = _obj.signedCertificate_bin;
         _loc4_ = _loc7_.hash(_loc4_);
         var _loc5_:Sequence = new Sequence();
         _loc5_[0] = new Sequence();
         _loc5_[0][0] = new ObjectIdentifier(0,0,_loc6_);
         _loc5_[0][1] = null;
         _loc5_[1] = new ByteString();
         _loc5_[1].writeBytes(_loc4_);
         _loc4_ = _loc5_.toDER();
         var _loc3_:ByteArray = new ByteArray();
         param1.sign(_loc4_,_loc3_,_loc4_.length);
         return _loc3_;
      }
      
      public function getPublicKey() : RSAKey
      {
         load();
         var _loc2_:ByteArray = _obj.signedCertificate.subjectPublicKeyInfo.subjectPublicKey as ByteArray;
         _loc2_.position = 0;
         var _loc1_:Object = DER.parse(_loc2_,[{"name":"N"},{"name":"E"}]);
         return new RSAKey(_loc1_.N,_loc1_.E.valueOf());
      }
      
      public function getSubjectPrincipal() : String
      {
         load();
         return Base64.encodeByteArray(_obj.signedCertificate.subject_bin);
      }
      
      public function getIssuerPrincipal() : String
      {
         load();
         return Base64.encodeByteArray(_obj.signedCertificate.issuer_bin);
      }
      
      public function getAlgorithmIdentifier() : String
      {
         return _obj.algorithmIdentifier.algorithmId.toString();
      }
      
      public function getNotBefore() : Date
      {
         return _obj.signedCertificate.validity.notBefore.date;
      }
      
      public function getNotAfter() : Date
      {
         return _obj.signedCertificate.validity.notAfter.date;
      }
      
      public function getCommonName() : String
      {
         var _loc1_:Sequence = _obj.signedCertificate.subject;
         return (_loc1_.findAttributeValue("2.5.4.3") as PrintableString).getString();
      }
   }
}
