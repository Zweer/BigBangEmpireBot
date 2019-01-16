package spine.attachments
{
   public class Attachment
   {
       
      
      var _name:String;
      
      public function Attachment(param1:String)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("name cannot be null.");
         }
         _name = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function toString() : String
      {
         return name;
      }
   }
}
