package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolBlockerAnimationGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.generic.SymbolIconMarriageGeneric;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftBigGeneric;
   import visuals.ui.elements.stats.SymbolStatsBattleSkillBackgroundGeneric;
   
   public class SymbolPrivateSystemMessageStreamGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateSystemMessageStream = null;
      
      public var backgroundHighlight:SymbolStreamListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolStreamListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolStreamListLineOddGeneric = null;
      
      public var backgroundIcon:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var iconSenderSystemMail:SymbolIconSystemStreamGeneric = null;
      
      public var iconGuild:SymbolIconGuildBigGeneric = null;
      
      public var iconItem:SymbolIconGiftBigGeneric = null;
      
      public var iconProposeMarriage:SymbolIconMarriageGeneric = null;
      
      public var txtCreation:ILabel = null;
      
      public var txtSubject:ILabelArea = null;
      
      public var iconUnread:SymbolIconExclamationMarkGeneric = null;
      
      public var btnLoadMore:SymbolButtonArrowDownGeneric = null;
      
      public var iconLoading:SymbolBlockerAnimationGeneric = null;
      
      public function SymbolPrivateSystemMessageStreamGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateSystemMessageStream;
         }
         else
         {
            _nativeObject = new SymbolPrivateSystemMessageStream();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolStreamListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolStreamListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolStreamListLineOddGeneric(_nativeObject.backgroundOdd);
         backgroundIcon = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.backgroundIcon);
         iconSenderSystemMail = new SymbolIconSystemStreamGeneric(_nativeObject.iconSenderSystemMail);
         iconGuild = new SymbolIconGuildBigGeneric(_nativeObject.iconGuild);
         iconItem = new SymbolIconGiftBigGeneric(_nativeObject.iconItem);
         iconProposeMarriage = new SymbolIconMarriageGeneric(_nativeObject.iconProposeMarriage);
         txtCreation = FlashLabel.fromNative(_nativeObject.txtCreation);
         txtSubject = FlashLabelArea.fromNative(_nativeObject.txtSubject);
         iconUnread = new SymbolIconExclamationMarkGeneric(_nativeObject.iconUnread);
         btnLoadMore = new SymbolButtonArrowDownGeneric(_nativeObject.btnLoadMore);
         iconLoading = new SymbolBlockerAnimationGeneric(_nativeObject.iconLoading);
      }
      
      public function setNativeInstance(param1:SymbolPrivateSystemMessageStream) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         if(_nativeObject.backgroundIcon)
         {
            backgroundIcon.setNativeInstance(_nativeObject.backgroundIcon);
         }
         if(_nativeObject.iconSenderSystemMail)
         {
            iconSenderSystemMail.setNativeInstance(_nativeObject.iconSenderSystemMail);
         }
         if(_nativeObject.iconGuild)
         {
            iconGuild.setNativeInstance(_nativeObject.iconGuild);
         }
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         if(_nativeObject.iconProposeMarriage)
         {
            iconProposeMarriage.setNativeInstance(_nativeObject.iconProposeMarriage);
         }
         FlashLabel.setNativeInstance(txtCreation,_nativeObject.txtCreation);
         FlashLabelArea.setNativeInstance(txtSubject,_nativeObject.txtSubject);
         if(_nativeObject.iconUnread)
         {
            iconUnread.setNativeInstance(_nativeObject.iconUnread);
         }
         if(_nativeObject.btnLoadMore)
         {
            btnLoadMore.setNativeInstance(_nativeObject.btnLoadMore);
         }
         if(_nativeObject.iconLoading)
         {
            iconLoading.setNativeInstance(_nativeObject.iconLoading);
         }
      }
   }
}
