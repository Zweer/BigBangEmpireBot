package websocket.hurlant.util.der
{
   import websocket.hurlant.util.Hex;
   
   public class Type
   {
      
      public static const TLS_CERT:Array = [{
         "name":"signedCertificate",
         "extract":true,
         "value":[{
            "name":"versionHolder",
            "optional":true,
            "value":[{"name":"version"}],
            "defaultValue":function():Sequence
            {
               var _loc1_:Sequence = new Sequence(0,0);
               var _loc2_:Integer = new Integer(2,1,Hex.toArray("00"));
               _loc1_.push(_loc2_);
               _loc1_.version = _loc2_;
               return _loc1_;
            }()
         },{"name":"serialNumber"},{
            "name":"signature",
            "value":[{"name":"algorithmId"}]
         },{
            "name":"issuer",
            "extract":true,
            "value":[{"name":"type"},{"name":"value"}]
         },{
            "name":"validity",
            "value":[{"name":"notBefore"},{"name":"notAfter"}]
         },{
            "name":"subject",
            "extract":true,
            "value":[]
         },{
            "name":"subjectPublicKeyInfo",
            "value":[{
               "name":"algorithm",
               "value":[{"name":"algorithmId"}]
            },{"name":"subjectPublicKey"}]
         },{
            "name":"extensions",
            "value":[]
         }]
      },{
         "name":"algorithmIdentifier",
         "value":[{"name":"algorithmId"}]
      },{
         "name":"encrypted",
         "value":null
      }];
      
      public static const CERTIFICATE:Array = [{
         "name":"tbsCertificate",
         "value":[{
            "name":"tag0",
            "value":[{"name":"version"}]
         },{"name":"serialNumber"},{"name":"signature"},{
            "name":"issuer",
            "value":[{"name":"type"},{"name":"value"}]
         },{
            "name":"validity",
            "value":[{"name":"notBefore"},{"name":"notAfter"}]
         },{"name":"subject"},{
            "name":"subjectPublicKeyInfo",
            "value":[{"name":"algorithm"},{"name":"subjectPublicKey"}]
         },{"name":"issuerUniqueID"},{"name":"subjectUniqueID"},{"name":"extensions"}]
      },{"name":"signatureAlgorithm"},{"name":"signatureValue"}];
      
      public static const RSA_PUBLIC_KEY:Array = [{"name":"modulus"},{"name":"publicExponent"}];
      
      public static const RSA_SIGNATURE:Array = [{
         "name":"algorithm",
         "value":[{"name":"algorithmId"}]
      },{"name":"hash"}];
       
      
      public function Type()
      {
         super();
      }
   }
}
