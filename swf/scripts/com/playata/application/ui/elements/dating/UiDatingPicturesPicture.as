package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.filter.BlurFilter;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.dating.SymbolDatingPictureGeneric;
   
   public class UiDatingPicturesPicture extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolDatingPictureGeneric = null;
      
      private var _datingIndex:int = -1;
      
      private var _stepIndex:int = -1;
      
      private var _onClickFunction:Function;
      
      private var _tooltip:UiTextTooltip;
      
      public function UiDatingPicturesPicture(param1:SymbolDatingPictureGeneric, param2:Function)
      {
         _content = param1;
         super(_content);
         _onClickFunction = param2;
         _tooltip = new UiTextTooltip(_content,"");
         onClick.add(handleClick);
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_datingIndex >= 0 && _stepIndex > 0)
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
         if(param1 <= -1 || param2 <= 0)
         {
            _tooltip.text = "";
            _content.visible = false;
            return;
         }
         if(!DatingUtil.hasRewardImage(param1,param2))
         {
            _tooltip.text = "";
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _datingIndex = param1;
         _stepIndex = param2;
         _content.picture.setUriSprite(DatingUtil.getGirlRewardImageUrl(param1,param2,"_thumb"),104,73,true,2);
         if(!Environment.info.isTouchScreen)
         {
            _tooltip.text = DatingUtil.getRewardGirlPicture(param1,param2);
         }
         if(param3)
         {
            _content.picture.removeAllFilters();
         }
         else
         {
            _content.picture.addFilter(new BlurFilter(10,10));
         }
      }
   }
}
