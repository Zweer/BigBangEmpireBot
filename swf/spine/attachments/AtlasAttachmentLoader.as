package spine.attachments
{
   import spine.Skin;
   import spine.atlas.Atlas;
   import spine.atlas.AtlasRegion;
   
   public class AtlasAttachmentLoader implements AttachmentLoader
   {
       
      
      private var atlas:Atlas;
      
      public function AtlasAttachmentLoader(param1:Atlas)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("atlas cannot be null.");
         }
         this.atlas = param1;
      }
      
      public static function nextPOT(param1:int) : int
      {
         param1--;
         param1 = param1 | param1 >> 1;
         param1 = param1 | param1 >> 2;
         param1 = param1 | param1 >> 4;
         param1 = param1 | param1 >> 8;
         param1 = param1 | param1 >> 16;
         return param1 + 1;
      }
      
      public function newRegionAttachment(param1:Skin, param2:String, param3:String) : RegionAttachment
      {
         var _loc7_:AtlasRegion = atlas.findRegion(param3);
         if(_loc7_ == null)
         {
            throw new Error("Region not found in atlas: " + param3 + " (region attachment: " + param2 + ")");
         }
         var _loc6_:RegionAttachment = new RegionAttachment(param2);
         _loc6_.rendererObject = _loc7_;
         var _loc4_:Number = _loc7_.page.width / nextPOT(_loc7_.page.width);
         var _loc5_:Number = _loc7_.page.height / nextPOT(_loc7_.page.height);
         _loc6_.setUVs(_loc7_.u * _loc4_,_loc7_.v * _loc5_,_loc7_.u2 * _loc4_,_loc7_.v2 * _loc5_,_loc7_.rotate);
         _loc6_.regionOffsetX = _loc7_.offsetX;
         _loc6_.regionOffsetY = _loc7_.offsetY;
         _loc6_.regionWidth = _loc7_.width;
         _loc6_.regionHeight = _loc7_.height;
         _loc6_.regionOriginalWidth = _loc7_.originalWidth;
         _loc6_.regionOriginalHeight = _loc7_.originalHeight;
         return _loc6_;
      }
      
      public function newMeshAttachment(param1:Skin, param2:String, param3:String) : MeshAttachment
      {
         var _loc7_:AtlasRegion = atlas.findRegion(param3);
         if(_loc7_ == null)
         {
            throw new Error("Region not found in atlas: " + param3 + " (mesh attachment: " + param2 + ")");
         }
         var _loc6_:MeshAttachment = new MeshAttachment(param2);
         _loc6_.rendererObject = _loc7_;
         var _loc4_:Number = _loc7_.page.width / nextPOT(_loc7_.page.width);
         var _loc5_:Number = _loc7_.page.height / nextPOT(_loc7_.page.height);
         _loc6_.regionU = _loc7_.u * _loc4_;
         _loc6_.regionV = _loc7_.v * _loc5_;
         _loc6_.regionU2 = _loc7_.u2 * _loc4_;
         _loc6_.regionV2 = _loc7_.v2 * _loc5_;
         _loc6_.regionRotate = _loc7_.rotate;
         _loc6_.regionOffsetX = _loc7_.offsetX;
         _loc6_.regionOffsetY = _loc7_.offsetY;
         _loc6_.regionWidth = _loc7_.width;
         _loc6_.regionHeight = _loc7_.height;
         _loc6_.regionOriginalWidth = _loc7_.originalWidth;
         _loc6_.regionOriginalHeight = _loc7_.originalHeight;
         return _loc6_;
      }
      
      public function newBoundingBoxAttachment(param1:Skin, param2:String) : BoundingBoxAttachment
      {
         return new BoundingBoxAttachment(param2);
      }
      
      public function newPathAttachment(param1:Skin, param2:String) : PathAttachment
      {
         return new PathAttachment(param2);
      }
   }
}
