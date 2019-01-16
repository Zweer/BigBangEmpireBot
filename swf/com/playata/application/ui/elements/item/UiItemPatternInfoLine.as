package com.playata.application.ui.elements.item
{
   import com.playata.application.data.item_pattern.ItemPattern;
   import com.playata.application.data.user.User;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.sewing_machine.SymbolItemPatternLineGeneric;
   
   public class UiItemPatternInfoLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolItemPatternLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _itemPattern:ItemPattern = null;
      
      private var _onClickFunction:Function = null;
      
      public function UiItemPatternInfoLine(param1:SymbolItemPatternLineGeneric, param2:int, param3:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _content.backgroundHighlight.visible = false;
         onClick.add(handleClick);
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get itemPattern() : ItemPattern
      {
         return _itemPattern;
      }
      
      override public function dispose() : void
      {
         _itemPattern = null;
         _content = null;
         super.dispose();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
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
      
      public function refresh(param1:ItemPattern, param2:int) : void
      {
         _index = param2;
         _itemPattern = param1;
         _content.backgroundEven.visible = _index % 2 == 0;
         _content.backgroundOdd.visible = _index % 2 != 0;
         if(_itemPattern == null)
         {
            _content.txtName.visible = false;
            _content.iconImage.visible = false;
            _content.iconCheckmark.visible = false;
            _content.iconLock.visible = false;
            _content.iconCounter.visible = false;
            return;
         }
         _content.txtName.visible = true;
         _content.iconImage.visible = true;
         _content.iconCheckmark.visible = _itemPattern.isFullyCollected(User.current.character.gender);
         _content.iconLock.visible = !_itemPattern.isCollectible();
         _content.iconCounter.visible = _itemPattern.isNew || _itemPattern.hasCollectableItemPatternValues;
         _content.txtName.text = _itemPattern.title;
         if(_content.txtName.numLines > 1)
         {
            _content.txtName.y = 4;
         }
         else
         {
            _content.txtName.y = 13;
         }
         _content.iconImage.setUriSprite(param1.iconImageUrl,50,50,true,7);
      }
   }
}
