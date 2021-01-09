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
   
   public class SymbolIgnoredCharacterContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIgnoredCharacterContainer = null;
      
      public var symbolPanelStreamHeaderBackground:SymbolPanelStreamHeaderBackgroundGeneric = null;
      
      public var txtTitle:ILabel = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtIgnoreDateCaption:ILabel = null;
      
      public var btnShow:SymbolUiButtonDefaultGeneric = null;
      
      public var btnUnignore:SymbolUiButtonDefaultGeneric = null;
      
      public var list:SymbolIgnoredCharacterListGeneric = null;
      
      public var symbolStatsBattleSkillBackground:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var txtIgnoreGuildInvites:ILabel = null;
      
      public var checkboxIgnoreGuildInvites:SymbolUiCheckboxGeneric = null;
      
      public var txtFriendMessagesOnly:ILabel = null;
      
      public var checkboxFriendMessagesOnly:SymbolUiCheckboxGeneric = null;
      
      public function SymbolIgnoredCharacterContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIgnoredCharacterContainer;
         }
         else
         {
            _nativeObject = new SymbolIgnoredCharacterContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolPanelStreamHeaderBackground = new SymbolPanelStreamHeaderBackgroundGeneric(_nativeObject.symbolPanelStreamHeaderBackground);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtIgnoreDateCaption = FlashLabel.fromNative(_nativeObject.txtIgnoreDateCaption);
         btnShow = new SymbolUiButtonDefaultGeneric(_nativeObject.btnShow);
         btnUnignore = new SymbolUiButtonDefaultGeneric(_nativeObject.btnUnignore);
         list = new SymbolIgnoredCharacterListGeneric(_nativeObject.list);
         symbolStatsBattleSkillBackground = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground);
         txtIgnoreGuildInvites = FlashLabel.fromNative(_nativeObject.txtIgnoreGuildInvites);
         checkboxIgnoreGuildInvites = new SymbolUiCheckboxGeneric(_nativeObject.checkboxIgnoreGuildInvites);
         txtFriendMessagesOnly = FlashLabel.fromNative(_nativeObject.txtFriendMessagesOnly);
         checkboxFriendMessagesOnly = new SymbolUiCheckboxGeneric(_nativeObject.checkboxFriendMessagesOnly);
      }
      
      public function setNativeInstance(param1:SymbolIgnoredCharacterContainer) : void
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
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabel.setNativeInstance(txtIgnoreDateCaption,_nativeObject.txtIgnoreDateCaption);
         if(_nativeObject.btnShow)
         {
            btnShow.setNativeInstance(_nativeObject.btnShow);
         }
         if(_nativeObject.btnUnignore)
         {
            btnUnignore.setNativeInstance(_nativeObject.btnUnignore);
         }
         if(_nativeObject.list)
         {
            list.setNativeInstance(_nativeObject.list);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground)
         {
            symbolStatsBattleSkillBackground.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground);
         }
         FlashLabel.setNativeInstance(txtIgnoreGuildInvites,_nativeObject.txtIgnoreGuildInvites);
         if(_nativeObject.checkboxIgnoreGuildInvites)
         {
            checkboxIgnoreGuildInvites.setNativeInstance(_nativeObject.checkboxIgnoreGuildInvites);
         }
         FlashLabel.setNativeInstance(txtFriendMessagesOnly,_nativeObject.txtFriendMessagesOnly);
         if(_nativeObject.checkboxFriendMessagesOnly)
         {
            checkboxFriendMessagesOnly.setNativeInstance(_nativeObject.checkboxFriendMessagesOnly);
         }
      }
   }
}
