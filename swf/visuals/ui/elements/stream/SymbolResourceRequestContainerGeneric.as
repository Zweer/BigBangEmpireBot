package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.stats.SymbolStatsBattleSkillBackgroundGeneric;
   
   public class SymbolResourceRequestContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolResourceRequestContainer = null;
      
      public var symbolPanelStreamHeaderBackground:SymbolPanelStreamHeaderBackgroundGeneric = null;
      
      public var txtTitle:ILabel = null;
      
      public var list:SymbolResourceRequestListGeneric = null;
      
      public var btnAcceptAll:SymbolUiButtonDefaultGeneric = null;
      
      public var symbolStatsBattleSkillBackground:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var txtFriendRequestsOnly:ILabel = null;
      
      public var ckbFriendRequestsOnly:SymbolUiCheckboxGeneric = null;
      
      public function SymbolResourceRequestContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolResourceRequestContainer;
         }
         else
         {
            _nativeObject = new SymbolResourceRequestContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolPanelStreamHeaderBackground = new SymbolPanelStreamHeaderBackgroundGeneric(_nativeObject.symbolPanelStreamHeaderBackground);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
         list = new SymbolResourceRequestListGeneric(_nativeObject.list);
         btnAcceptAll = new SymbolUiButtonDefaultGeneric(_nativeObject.btnAcceptAll);
         symbolStatsBattleSkillBackground = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground);
         txtFriendRequestsOnly = FlashLabel.fromNative(_nativeObject.txtFriendRequestsOnly);
         ckbFriendRequestsOnly = new SymbolUiCheckboxGeneric(_nativeObject.ckbFriendRequestsOnly);
      }
      
      public function setNativeInstance(param1:SymbolResourceRequestContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolPanelStreamHeaderBackground)
         {
            symbolPanelStreamHeaderBackground.setNativeInstance(_nativeObject.symbolPanelStreamHeaderBackground);
         }
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.list)
         {
            list.setNativeInstance(_nativeObject.list);
         }
         if(_nativeObject.btnAcceptAll)
         {
            btnAcceptAll.setNativeInstance(_nativeObject.btnAcceptAll);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground)
         {
            symbolStatsBattleSkillBackground.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground);
         }
         FlashLabel.setNativeInstance(txtFriendRequestsOnly,_nativeObject.txtFriendRequestsOnly);
         if(_nativeObject.ckbFriendRequestsOnly)
         {
            ckbFriendRequestsOnly.setNativeInstance(_nativeObject.ckbFriendRequestsOnly);
         }
      }
   }
}
