package spine.attachments
{
   public class AttachmentType
   {
      
      public static const region:AttachmentType = new AttachmentType(0,"region");
      
      public static const regionsequence:AttachmentType = new AttachmentType(1,"regionsequence");
      
      public static const boundingbox:AttachmentType = new AttachmentType(2,"boundingbox");
      
      public static const mesh:AttachmentType = new AttachmentType(3,"mesh");
      
      public static const linkedmesh:AttachmentType = new AttachmentType(3,"linkedmesh");
      
      public static const path:AttachmentType = new AttachmentType(4,"path");
       
      
      public var ordinal:int;
      
      public var name:String;
      
      public function AttachmentType(param1:int, param2:String)
      {
         super();
         this.ordinal = param1;
         this.name = param2;
      }
   }
}
