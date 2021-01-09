package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultCheckGeneric;
   import visuals.ui.elements.icons.SymbolIconUserVoucherRewardGeneric;
   import visuals.ui.elements.stats.SymbolStatsBattleSkillBackgroundGeneric;
   
   public class SymbolUserVoucherLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUserVoucherLine = null;
      
      public var symbolStatsBattleSkillBackground:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var symbolStatsBattleSkillBackground2:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var icon:SymbolIconUserVoucherRewardGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtValidUntil:ILabelArea = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var btnRedeem:SymbolUiButtonDefaultCheckGeneric = null;
      
      public function SymbolUserVoucherLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUserVoucherLine;
         }
         else
         {
            _nativeObject = new SymbolUserVoucherLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolStatsBattleSkillBackground = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground);
         symbolStatsBattleSkillBackground2 = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground2);
         icon = new SymbolIconUserVoucherRewardGeneric(_nativeObject.icon);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtValidUntil = FlashLabelArea.fromNative(_nativeObject.txtValidUntil);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         btnRedeem = new SymbolUiButtonDefaultCheckGeneric(_nativeObject.btnRedeem);
      }
      
      public function setNativeInstance(param1:SymbolUserVoucherLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolStatsBattleSkillBackground)
         {
            symbolStatsBattleSkillBackground.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground2)
         {
            symbolStatsBattleSkillBackground2.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground2);
         }
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtValidUntil,_nativeObject.txtValidUntil);
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.btnRedeem)
         {
            btnRedeem.setNativeInstance(_nativeObject.btnRedeem);
         }
      }
   }
}
