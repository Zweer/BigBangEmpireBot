package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolDungeonPanelTimeGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonPanelTime = null;
      
      public var txtTimeLeft:ILabel = null;
      
      public function SymbolDungeonPanelTimeGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonPanelTime;
         }
         else
         {
            _nativeObject = new SymbolDungeonPanelTime();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtTimeLeft = FlashLabel.fromNative(_nativeObject.txtTimeLeft);
      }
      
      public function setNativeInstance(param1:SymbolDungeonPanelTime) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtTimeLeft,_nativeObject.txtTimeLeft);
      }
   }
}
