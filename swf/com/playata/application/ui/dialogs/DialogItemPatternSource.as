package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.dialogs.SymbolDialogItemPatternSourceGeneric;
   
   public class DialogItemPatternSource extends UiDialog
   {
       
      
      private var _button:UiTextButton = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      public function DialogItemPatternSource(param1:String, param2:String, param3:String)
      {
         var _loc5_:Number = NaN;
         var _loc8_:SymbolDialogItemPatternSourceGeneric = new SymbolDialogItemPatternSourceGeneric();
         super(_loc8_);
         _queued = false;
         var _loc6_:Number = _loc8_.txtText.height;
         _loc8_.txtDialogTitle.text = param1;
         _loc8_.txtText.htmlText = param2;
         var _loc7_:Number = Math.min(450,_loc8_.txtText.textHeight);
         var _loc4_:Number = _loc8_.txtText.textHeight;
         if(_loc7_ > _loc6_)
         {
            _loc5_ = _loc7_ - _loc6_;
            _loc8_.dialogBackground.height = _loc8_.dialogBackground.height + _loc5_;
            _loc8_.txtText.height = _loc8_.txtText.height + (_loc5_ + 5);
            _loc8_.scrollLine.height = _loc8_.scrollLine.height + (_loc5_ + 5);
            _loc8_.btnOk.y = _loc8_.btnOk.y + _loc5_;
            _loc8_.dialogBackground.y = _loc8_.dialogBackground.y - _loc5_ / 2;
            _loc8_.txtText.y = _loc8_.txtText.y - _loc5_ / 2;
            _loc8_.btnOk.y = _loc8_.btnOk.y - _loc5_ / 2;
            _loc8_.txtDialogTitle.y = _loc8_.txtDialogTitle.y - _loc5_ / 2;
            _loc8_.scrollKnob.y = _loc8_.scrollKnob.y - _loc5_ / 2;
            _loc8_.scrollLine.y = _loc8_.scrollLine.y - _loc5_ / 2;
         }
         else
         {
            _loc8_.txtText.verticallyAlignText(60);
         }
         _button = new UiTextButton(_loc8_.btnOk,param3,"",onClickClose);
         if(_loc4_ > _loc7_)
         {
            _scrollBar = new UiScrollBar(_loc8_.scrollKnob,_loc8_.scrollLine,_loc8_.txtText);
            _loc8_.txtText.verticalScrollBar = _scrollBar;
            _scrollBar.refresh();
         }
         else
         {
            _loc8_.scrollKnob.visible = false;
            _loc8_.scrollLine.visible = false;
         }
      }
      
      override public function dispose() : void
      {
         _button.dispose();
         _button = null;
         if(_scrollBar)
         {
            _scrollBar.dispose();
            _scrollBar = null;
         }
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
