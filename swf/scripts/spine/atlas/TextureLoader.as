package spine.atlas
{
   public interface TextureLoader
   {
       
      
      function loadPage(param1:AtlasPage, param2:String) : void;
      
      function loadRegion(param1:AtlasRegion) : void;
      
      function unloadPage(param1:AtlasPage) : void;
   }
}
