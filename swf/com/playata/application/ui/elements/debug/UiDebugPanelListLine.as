package com.playata.application.ui.elements.debug
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.debug.SymbolDebugLineGeneric;
   
   public class UiDebugPanelListLine extends ListLine
   {
       
      
      private var _rawContent:SymbolDebugLineGeneric = null;
      
      private var _btnSend:UiButton;
      
      private var _rawItem:UiDebugPanelListLineItem;
      
      public function UiDebugPanelListLine(param1:UiDebugPanelListLineItem, param2:int)
      {
         _rawContent = new SymbolDebugLineGeneric();
         super(_rawContent,param2);
         _rawContent.txtHeader.autoFontSize = true;
         _rawContent.txtDebugFunction.autoFontSize = true;
         _btnSend = new UiButton(_rawContent.btnSend,"",handleCLick);
      }
      
      override public function refresh(param1:IListItem, param2:int) : void
      {
         super.refresh(param1,param2);
         if(!param1)
         {
            return;
         }
         _rawItem = param1 as UiDebugPanelListLineItem;
         _rawContent.txtHeader.text = _rawItem.name;
         _rawContent.txtDebugFunction.text = _rawItem.name;
         _rawContent.txtHeader.visible = _rawItem.header;
         _rawContent.txtDebugFunction.visible = !_rawItem.header;
         _rawContent.btnSend.visible = !_rawItem.header;
         if(!§§pop())
         {
            var _loc3_:Boolean = true;
            _rawContent.txtInput.visible = _loc3_;
            _rawContent.inputBackground.visible = _loc3_;
            _rawContent.txtInput.text = _rawItem.defaultValue;
            _rawContent.txtDebugFunction.width = _rawContent.txtInput.x - 3 - _rawContent.txtDebugFunction.x;
         }
         else
         {
            _loc3_ = false;
            _rawContent.txtInput.visible = _loc3_;
            _rawContent.inputBackground.visible = _loc3_;
            _rawContent.txtDebugFunction.width = _rawContent.txtInput.x + _rawContent.txtInput.width - _rawContent.txtDebugFunction.x;
         }
      }
      
      override public function dispose() : void
      {
         _btnSend.dispose();
         _btnSend = null;
         super.dispose();
      }
      
      private function handleCLick(param1:InteractionEvent) : void
      {
         if(_rawItem && _rawItem.onClick)
         {
            _rawItem.onClick(_rawItem.functionName,!!_rawContent.txtInput.visible?_rawContent.txtInput.text:null);
         }
      }
      
      override public function get backgroundHighlight() : IDisplayObject
      {
         return _rawContent.backgroundHighlight;
      }
      
      override public function get backgroundEven() : IDisplayObject
      {
         return _rawContent.backgroundEven;
      }
      
      override public function get backgroundOdd() : IDisplayObject
      {
         return _rawContent.backgroundOdd;
      }
   }
}
