package com.playata.application.ui.elements.debug
{
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.display.ui.controls.ScrollList;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.debug.SymbolDebugContentGeneric;
   
   public class UiDebugPanelList extends ScrollList implements IListFilter
   {
       
      
      private var _content:SymbolDebugContentGeneric;
      
      private var _filterDefaultText:String = "Filter";
      
      public function UiDebugPanelList(param1:SymbolDebugContentGeneric)
      {
         _content = param1;
         super(_content.listContainer,UiDebugPanelListLine,Direction.VERTICAL,new UiScrollBar(_content.scrollBarKnob,_content.scrollBarLine,this),null,null,false,false,sortFunction);
         currentFilter = this;
         _content.inputFilter.text = _filterDefaultText;
         _content.inputFilter.onClick.add(handleSearchClick);
         _content.inputFilter.onChange.add(handleTextChanged);
      }
      
      private function sortFunction(param1:UiDebugPanelListLineItem, param2:UiDebugPanelListLineItem) : int
      {
         return param1.index - param2.index;
      }
      
      override protected function selectLine(param1:ListLine) : void
      {
      }
      
      override protected function doubleClickLine(param1:ListLine) : void
      {
      }
      
      private function handleSearchClick(param1:InteractionEvent) : void
      {
         if(_content.inputFilter.text == _filterDefaultText)
         {
            _content.inputFilter.text = "";
         }
      }
      
      private function handleTextChanged(param1:ITextInput) : void
      {
         refreshList();
      }
      
      public function matches(param1:IListItem) : Boolean
      {
         var _loc2_:* = null;
         if(_content.inputFilter.text == _filterDefaultText || _content.inputFilter.text == "")
         {
            return true;
         }
         var _loc3_:String = _content.inputFilter.text.toLowerCase();
         if(param1 is UiDebugPanelListLineItem)
         {
            _loc2_ = param1 as UiDebugPanelListLineItem;
            return _loc2_.matches(_loc3_);
         }
         return false;
      }
   }
}
