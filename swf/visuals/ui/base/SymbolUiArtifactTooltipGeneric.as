package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.guild.SymbolGuildArtifactTooltipItemGeneric;
   
   public class SymbolUiArtifactTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiArtifactTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var artifact1:SymbolGuildArtifactTooltipItemGeneric = null;
      
      public var artifact2:SymbolGuildArtifactTooltipItemGeneric = null;
      
      public var artifact3:SymbolGuildArtifactTooltipItemGeneric = null;
      
      public var artifact4:SymbolGuildArtifactTooltipItemGeneric = null;
      
      public var artifact5:SymbolGuildArtifactTooltipItemGeneric = null;
      
      public function SymbolUiArtifactTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiArtifactTooltip;
         }
         else
         {
            _nativeObject = new SymbolUiArtifactTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         artifact1 = new SymbolGuildArtifactTooltipItemGeneric(_nativeObject.artifact1);
         artifact2 = new SymbolGuildArtifactTooltipItemGeneric(_nativeObject.artifact2);
         artifact3 = new SymbolGuildArtifactTooltipItemGeneric(_nativeObject.artifact3);
         artifact4 = new SymbolGuildArtifactTooltipItemGeneric(_nativeObject.artifact4);
         artifact5 = new SymbolGuildArtifactTooltipItemGeneric(_nativeObject.artifact5);
      }
      
      public function setNativeInstance(param1:SymbolUiArtifactTooltip) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.artifact1)
         {
            artifact1.setNativeInstance(_nativeObject.artifact1);
         }
         if(_nativeObject.artifact2)
         {
            artifact2.setNativeInstance(_nativeObject.artifact2);
         }
         if(_nativeObject.artifact3)
         {
            artifact3.setNativeInstance(_nativeObject.artifact3);
         }
         if(_nativeObject.artifact4)
         {
            artifact4.setNativeInstance(_nativeObject.artifact4);
         }
         if(_nativeObject.artifact5)
         {
            artifact5.setNativeInstance(_nativeObject.artifact5);
         }
      }
   }
}
