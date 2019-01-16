package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.filter.GrayscaleFilter;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dating.SymbolDatingPicturesLineGeneric;
   
   public class UiDatingPictureLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolDatingPicturesLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _datingIndex:int = -1;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _tooltipLock:UiTextTooltip;
      
      private var _available:Boolean;
      
      private var _tooltipExclamationMark:UiTextTooltip;
      
      public function UiDatingPictureLine(param1:SymbolDatingPicturesLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _tooltipLock = new UiTextTooltip(_content.lock,"");
         _tooltipExclamationMark = new UiTextTooltip(_content.iconExclamationMark,LocText.current.text("screen/quest/button_dating_collected_tooltip"));
         _content.backgroundHighlight.visible = false;
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get datingIndex() : int
      {
         return _datingIndex;
      }
      
      public function get available() : Boolean
      {
         return _available;
      }
      
      override public function dispose() : void
      {
         _datingIndex = -1;
         _content = null;
         super.dispose();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         if(!_available || _datingIndex <= 0)
         {
            return;
         }
         Environment.audio.playFX("ui_button_click.mp3");
         §§push(_onDoubleClickFunction(this));
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.txtName.visible)
         {
            return;
         }
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 != 0;
      }
      
      public function refresh(param1:int, param2:int) : void
      {
         var _loc4_:* = null;
         _index = param2;
         _datingIndex = param1;
         if(_datingIndex < -1)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.backgroundEven.visible = _index % 2 == 0;
         _content.backgroundOdd.visible = _index % 2 != 0;
         _content.backgroundHighlight.visible = false;
         var _loc3_:Character = User.current.character;
         _available = param1 == -1 || param1 == 0 || _loc3_.dating.getUnlockedPicturesByDatingIndex(param1) > 0 || _loc3_.dating.hasActiveDatingStep(param1) || _loc3_.dating.isDatingAvailable(_loc3_,param1);
         _content.lock.visible = !_available;
         _content.iconCheckmark.visible = param1 > -1 && (param1 == 0 || _loc3_.dating.getUnlockedPicturesByDatingIndex(param1) >= DatingUtil.getRewardImageCount(param1));
         _content.iconExclamationMark.visible = false;
         if(!_available)
         {
            _tooltipLock.text = DatingUtil.getUnlockText(param1);
            _content.image.addFilter(new GrayscaleFilter());
         }
         else
         {
            _loc4_ = _loc3_.dating.getActiveDatingStepByDating(param1);
            if(_loc4_ != null && !_loc4_.isRewardProcessed && _loc4_.allPointsCollected())
            {
               _content.iconExclamationMark.visible = true;
            }
            _content.image.removeAllFilters();
         }
         if(_content.lock.visible || _content.iconExclamationMark.visible || _content.iconCheckmark.visible)
         {
            _content.txtName.width = 122;
         }
         else
         {
            _content.txtName.width = 150;
         }
         _content.image.removeAllChildren();
         if(param1 == -1)
         {
            _content.image.addChild(UriSprite.load(ServerInfo.assetURL("dating/all_t","png"),76,62,true,7));
            _content.txtName.text = LocText.current.text("dating/pictures/line/all/name");
         }
         else
         {
            _content.image.addChild(UriSprite.load(DatingUtil.getGirlThumbnailImageUrl(param1),76,62,true,7));
            _content.txtName.text = DatingUtil.getName(_datingIndex);
         }
         _content.txtName.autoFontSize = true;
         if(_content.txtName.numLines > 1)
         {
            _content.txtName.y = 4;
         }
         else
         {
            _content.txtName.y = 13;
         }
      }
   }
}
