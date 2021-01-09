package starling.text
{
   import starling.display.MeshBatch;
   import starling.styles.MeshStyle;
   
   public interface ITextCompositor
   {
       
      
      function fillMeshBatch(param1:MeshBatch, param2:Number, param3:Number, param4:String, param5:TextFormat, param6:TextOptions = null) : void;
      
      function clearMeshBatch(param1:MeshBatch) : void;
      
      function getDefaultMeshStyle(param1:MeshStyle, param2:TextFormat, param3:TextOptions) : MeshStyle;
      
      function dispose() : void;
   }
}
