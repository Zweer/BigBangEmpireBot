package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolIconButtonDeleteGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultCheckGeneric;
   import visuals.ui.elements.stats.SymbolStatsBattleSkillBackgroundGeneric;
   
   public class SymbolResourceRequestGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolResourceRequest = null;
      
      public var symbolStatsBattleSkillBackground:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var symbolStatsBattleSkillBackground2:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var iconResource:SymbolIconResourceStreamGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var btnAccept:SymbolUiButtonDefaultCheckGeneric = null;
      
      public var btnDecline:SymbolIconButtonDeleteGeneric = null;
      
      public function SymbolResourceRequestGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolResourceRequest;
         }
         else
         {
            _nativeObject = new SymbolResourceRequest();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolStatsBattleSkillBackground = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground);
         symbolStatsBattleSkillBackground2 = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground2);
         iconResource = new SymbolIconResourceStreamGeneric(_nativeObject.iconResource);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         btnAccept = new SymbolUiButtonDefaultCheckGeneric(_nativeObject.btnAccept);
         btnDecline = new SymbolIconButtonDeleteGeneric(_nativeObject.btnDecline);
      }
      
      public function setNativeInstance(param1:SymbolResourceRequest) : void
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
         if(_nativeObject.iconResource)
         {
            iconResource.setNativeInstance(_nativeObject.iconResource);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.btnAccept)
         {
            btnAccept.setNativeInstance(_nativeObject.btnAccept);
         }
         if(_nativeObject.btnDecline)
         {
            btnDecline.setNativeInstance(_nativeObject.btnDecline);
         }
      }
   }
}
