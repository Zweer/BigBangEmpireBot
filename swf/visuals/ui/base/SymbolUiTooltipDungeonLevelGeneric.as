package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   
   public class SymbolUiTooltipDungeonLevelGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiTooltipDungeonLevel = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var title:ILabelArea = null;
      
      public var tooltip:ILabelArea = null;
      
      public var txtRequirements:ILabelArea = null;
      
      public var iconFans:SymbolIconFansGeneric = null;
      
      public var txtFans:ILabelArea = null;
      
      public function SymbolUiTooltipDungeonLevelGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiTooltipDungeonLevel;
         }
         else
         {
            _nativeObject = new SymbolUiTooltipDungeonLevel();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         title = FlashLabelArea.fromNative(_nativeObject.title);
         tooltip = FlashLabelArea.fromNative(_nativeObject.tooltip);
         txtRequirements = FlashLabelArea.fromNative(_nativeObject.txtRequirements);
         iconFans = new SymbolIconFansGeneric(_nativeObject.iconFans);
         txtFans = FlashLabelArea.fromNative(_nativeObject.txtFans);
      }
      
      public function setNativeInstance(param1:SymbolUiTooltipDungeonLevel) : void
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
         FlashLabelArea.setNativeInstance(title,_nativeObject.title);
         FlashLabelArea.setNativeInstance(tooltip,_nativeObject.tooltip);
         FlashLabelArea.setNativeInstance(txtRequirements,_nativeObject.txtRequirements);
         if(_nativeObject.iconFans)
         {
            iconFans.setNativeInstance(_nativeObject.iconFans);
         }
         FlashLabelArea.setNativeInstance(txtFans,_nativeObject.txtFans);
      }
   }
}
