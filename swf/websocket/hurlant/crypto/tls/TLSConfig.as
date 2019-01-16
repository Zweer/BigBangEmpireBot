package websocket.hurlant.crypto.tls
{
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.cert.MozillaRootCertificates;
   import websocket.hurlant.crypto.cert.X509CertificateCollection;
   import websocket.hurlant.crypto.rsa.RSAKey;
   import websocket.hurlant.util.der.PEM;
   
   public class TLSConfig
   {
       
      
      public var entity:uint;
      
      public var certificate:ByteArray;
      
      public var privateKey:RSAKey;
      
      public var cipherSuites:Array;
      
      public var compressions:Array;
      
      public var ignoreCommonNameMismatch:Boolean = false;
      
      public var trustAllCertificates:Boolean = false;
      
      public var trustSelfSignedCertificates:Boolean = false;
      
      public var promptUserForAcceptCert:Boolean = false;
      
      public var CAStore:X509CertificateCollection;
      
      public var localKeyStore:X509CertificateCollection;
      
      public var version:uint;
      
      public function TLSConfig(param1:uint, param2:Array = null, param3:Array = null, param4:ByteArray = null, param5:RSAKey = null, param6:X509CertificateCollection = null, param7:uint = 0)
      {
         super();
         this.entity = param1;
         this.cipherSuites = param2;
         this.compressions = param3;
         this.certificate = param4;
         this.privateKey = param5;
         this.CAStore = param6;
         this.version = param7;
         if(param2 == null)
         {
            this.cipherSuites = CipherSuites.getDefaultSuites();
         }
         if(param3 == null)
         {
            this.compressions = [0];
         }
         if(param6 == null)
         {
            this.CAStore = new MozillaRootCertificates();
         }
         if(param7 == 0)
         {
            this.version = 769;
         }
      }
      
      public function setPEMCertificate(param1:String, param2:String = null) : void
      {
         if(param2 == null)
         {
            param2 = param1;
         }
         certificate = PEM.readCertIntoArray(param1);
         privateKey = PEM.readRSAPrivateKey(param2);
      }
   }
}
