package spine.attachments
{
   public dynamic class PathAttachment extends VertexAttachment
   {
       
      
      public var lengths:Vector.<Number>;
      
      public var closed:Boolean;
      
      public var constantSpeed:Boolean;
      
      public function PathAttachment(param1:String)
      {
         super(param1);
      }
   }
}
