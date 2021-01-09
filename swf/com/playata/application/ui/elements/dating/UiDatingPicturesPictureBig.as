package com.playata.application.ui.elements.dating
{
   import com.greensock.easing.Sine;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.filter.BlurFilter;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.dating.SymbolDatingPictureBigGeneric;
   
   public class UiDatingPicturesPictureBig extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolDatingPictureBigGeneric = null;
      
      private var _datingIndex:int = -1;
      
      private var _stepIndex:int = -1;
      
      private var _onClickFunction:Function;
      
      private var _baseAngle:Number;
      
      private var _tooltip:UiTextTooltip;
      
      public function UiDatingPicturesPictureBig(param1:SymbolDatingPictureBigGeneric, param2:Function)
      {
         _content = param1;
         super(_content);
         _onClickFunction = param2;
         _tooltip = new UiTextTooltip(_content,"");
         onClick.add(handleClick);
         _baseAngle = _content.rotation;
         _content.picture.removeAllChildren();
      }
      
      public function show() : void
      {
         _content.visible = true;
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_datingIndex >= 0 && _stepIndex > 0 && _content.picture.visible)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            _onClickFunction(_datingIndex,_stepIndex);
         }
      }
      
      public function refresh(param1:int, param2:int, param3:Boolean) : void
      {
         if(!_content)
         {
            return;
         }
         if(param1 == _datingIndex && param2 == _stepIndex)
         {
            return;
         }
         _datingIndex = param1;
         _stepIndex = param2;
         if(param1 < 0 || param2 <= 0)
         {
            _content.picture.visible = false;
            return;
         }
         if(param1 == 0 && param2 > 2)
         {
            _content.visible = false;
            return;
         }
         if(!DatingUtil.hasRewardImage(param1,param2))
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.txtDescription.visible = false;
         _content.picture.visible = true;
         _content.picture.setUriSprite(DatingUtil.getGirlRewardImageUrl(param1,param2,"_thumb"),163,114,true,2);
         if(param3)
         {
            _content.picture.removeAllFilters();
         }
         else
         {
            _content.picture.addFilter(new BlurFilter(10,10));
         }
         _content.tweenTo(0.5,{
            "rotation":_baseAngle - 5 + Math.random() * 10,
            "ease":Sine.easeInOut
         });
         if(!Environment.info.isTouchScreen)
         {
            _tooltip.text = DatingUtil.getRewardGirlPicture(param1,param2);
         }
      }
      
      public function refreshLocked(param1:int, param2:int) : void
      {
         if(!_content)
         {
            return;
         }
         if(param1 == _datingIndex && param2 == _stepIndex)
         {
            return;
         }
         if(param1 == 0 && param2 > 2)
         {
            _content.visible = false;
            return;
         }
         if(!DatingUtil.hasRewardImage(param1,param2))
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _tooltip.text = "";
         _datingIndex = param1;
         _stepIndex = param2;
         _content.picture.visible = false;
         _content.txtDescription.visible = DatingUtil.hasRewardImage(param1,param2);
         _content.txtDescription.text = DatingUtil.getRewardGirlPicture(param1,param2);
         _content.txtDescription.autoFontSize = true;
         _content.txtDescription.y = (_content.mouseLayer.height - _content.txtDescription.textHeight) / 2 + _content.mouseLayer.y;
         _content.txtDescription.x = (_content.mouseLayer.width - _content.txtDescription.textWidth) / 2 + _content.mouseLayer.x;
      }
   }
}
