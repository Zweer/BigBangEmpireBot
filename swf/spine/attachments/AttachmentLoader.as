package spine.attachments
{
   import spine.Skin;
   
   public interface AttachmentLoader
   {
       
      
      function newRegionAttachment(param1:Skin, param2:String, param3:String) : RegionAttachment;
      
      function newMeshAttachment(param1:Skin, param2:String, param3:String) : MeshAttachment;
      
      function newBoundingBoxAttachment(param1:Skin, param2:String) : BoundingBoxAttachment;
      
      function newPathAttachment(param1:Skin, param2:String) : PathAttachment;
   }
}
