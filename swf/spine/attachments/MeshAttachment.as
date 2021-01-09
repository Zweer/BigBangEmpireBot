package spine.attachments
{
   public dynamic class MeshAttachment extends VertexAttachment
   {
       
      
      public var worldVertices:Vector.<Number>;
      
      public var uvs:Vector.<Number>;
      
      public var regionUVs:Vector.<Number>;
      
      public var triangles:Vector.<uint>;
      
      public var r:Number = 1;
      
      public var g:Number = 1;
      
      public var b:Number = 1;
      
      public var a:Number = 1;
      
      public var hullLength:int;
      
      private var _parentMesh:MeshAttachment;
      
      public var inheritDeform:Boolean;
      
      public var path:String;
      
      public var rendererObject:Object;
      
      public var regionU:Number;
      
      public var regionV:Number;
      
      public var regionU2:Number;
      
      public var regionV2:Number;
      
      public var regionRotate:Boolean;
      
      public var regionOffsetX:Number;
      
      public var regionOffsetY:Number;
      
      public var regionWidth:Number;
      
      public var regionHeight:Number;
      
      public var regionOriginalWidth:Number;
      
      public var regionOriginalHeight:Number;
      
      public var edges:Vector.<int>;
      
      public var width:Number;
      
      public var height:Number;
      
      public function MeshAttachment(param1:String)
      {
         super(param1);
      }
      
      public function updateUVs() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Number = regionU2 - regionU;
         var _loc4_:Number = regionV2 - regionV;
         var _loc3_:int = regionUVs.length;
         if(!uvs || uvs.length != _loc3_)
         {
            uvs = new Vector.<Number>(_loc3_,true);
         }
         if(regionRotate)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               uvs[_loc2_] = regionU + regionUVs[int(_loc2_ + 1)] * _loc1_;
               uvs[int(_loc2_ + 1)] = regionV + _loc4_ - regionUVs[_loc2_] * _loc4_;
               _loc2_ = _loc2_ + 2;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               uvs[_loc2_] = regionU + regionUVs[_loc2_] * _loc1_;
               uvs[int(_loc2_ + 1)] = regionV + regionUVs[int(_loc2_ + 1)] * _loc4_;
               _loc2_ = _loc2_ + 2;
            }
         }
      }
      
      override public function applyDeform(param1:VertexAttachment) : Boolean
      {
         return this == param1 || inheritDeform && _parentMesh == param1;
      }
      
      public function get parentMesh() : MeshAttachment
      {
         return _parentMesh;
      }
      
      public function set parentMesh(param1:MeshAttachment) : void
      {
         _parentMesh = param1;
         if(param1 != null)
         {
            bones = param1.bones;
            vertices = param1.vertices;
            worldVerticesLength = param1.worldVerticesLength;
            regionUVs = param1.regionUVs;
            triangles = param1.triangles;
            hullLength = param1.hullLength;
            edges = param1.edges;
            width = param1.width;
            height = param1.height;
         }
      }
   }
}
