package websocket.hurlant.crypto.cert
{
   public class X509CertificateCollection
   {
       
      
      private var _map:Object;
      
      public function X509CertificateCollection()
      {
         super();
         _map = {};
      }
      
      public function addPEMCertificate(param1:String, param2:String, param3:String) : void
      {
         _map[param2] = new X509Certificate(param3);
      }
      
      public function addCertificate(param1:X509Certificate) : void
      {
         var _loc2_:String = param1.getSubjectPrincipal();
         _map[_loc2_] = param1;
      }
      
      public function getCertificate(param1:String) : X509Certificate
      {
         return _map[param1];
      }
   }
}
