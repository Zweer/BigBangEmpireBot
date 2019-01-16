package com.playata.application.ui.elements.title
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.titles.Title;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.titles.SymbolTitleLineGeneric;
   
   public class UiTitleLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolTitleLineGeneric;
      
      private var _btnCheckmark:UiCheckBox;
      
      private var _tooltipSource:UiTextTooltip;
      
      private var _onSelected:Function;
      
      private var _title:Title;
      
      private var _index:int;
      
      public function UiTitleLine(param1:SymbolTitleLineGeneric, param2:Function)
      {
         _content = param1;
         super(_content);
         _onSelected = param2;
         _btnCheckmark = new UiCheckBox(param1.checkbox,false,LocText.current.text("dialog/titles/use_title_tooltip"));
         _tooltipSource = new UiTextTooltip(param1,"");
         onClick.add(handleClick);
         onInteractionOver.add(handleOver);
         onInteractionOut.add(handleOut);
         onDoubleClick.add(handleDoubleClick);
      }
      
      private function handleOver(param1:InteractionEvent) : void
      {
         if(!_btnCheckmark.checked && !_content.iconLock.visible)
         {
            updateHighlight(true,0.75);
         }
      }
      
      private function handleOut(param1:InteractionEvent) : void
      {
         if(!_btnCheckmark.checked && !_content.iconLock.visible)
         {
            updateHighlight(false);
         }
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         if(_content.checkbox.visible)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            _onSelected(_title,true);
         }
         else
         {
            Environment.audio.playFX("ui_button_click_disabled.mp3");
         }
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_content.checkbox.visible)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            _onSelected(_title);
         }
         else
         {
            Environment.audio.playFX("ui_button_click_disabled.mp3");
         }
      }
      
      override public function dispose() : void
      {
         _btnCheckmark.dispose();
         _btnCheckmark = null;
         super.dispose();
      }
      
      public function get title() : Title
      {
         return _title;
      }
      
      public function refresh(param1:Title, param2:Character, param3:int, param4:String) : void
      {
         _index = param3;
         _title = param1;
         _btnCheckmark.checked = param1.identifier == param4;
         if(_btnCheckmark.checked)
         {
            updateHighlight(true);
         }
         else
         {
            updateHighlight(false);
         }
         _content.txtTitle.text = param1.getNameWithTitle(param2.name);
         _content.iconNew.visible = param1.isNew;
         _content.shop.visible = false;
         _content.goal.visible = false;
         _content.secret.visible = false;
         _content.checked.visible = false;
         _content.itemPattern.visible = false;
         _content.movieTournament.visible = false;
         _content.eventQuest.visible = false;
         if(param1.identifier == "" || param1.identifier.indexOf("title_marriage") >= 0 || param2.hasTitle(param1))
         {
            _content.checkbox.visible = true;
            _tooltipSource.text = param1.tooltipCollected(param2);
         }
         else
         {
            _content.checkbox.visible = false;
            _tooltipSource.text = param1.tooltipSource;
         }
         _content.iconLock.visible = !_content.checkbox.visible;
         switch(int(param1.source) - 1)
         {
            case 0:
               _content.goal.visible = true;
               break;
            case 1:
               _content.shop.visible = true;
               break;
            case 2:
               _content.secret.visible = true;
               break;
            case 3:
               _content.itemPattern.visible = true;
               break;
            case 4:
               _content.movieTournament.visible = true;
               break;
            case 5:
               _content.eventQuest.visible = true;
               break;
            case 6:
               _content.shop.visible = true;
         }
         _content.txtSource.text = param1.infoSource;
         _content.txtSource.autoFontSize = true;
         _content.visible = true;
      }
      
      private function updateHighlight(param1:Boolean, param2:Number = 1) : void
      {
         _content.backgroundHighlight.alpha = param2;
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 == 1;
      }
      
      public function hide() : void
      {
         _title = null;
         _content.visible = false;
      }
   }
}
