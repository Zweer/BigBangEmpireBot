package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.outfit.DefaultOutfit;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.outfit.UiOutfitContent;
   import com.playata.application.ui.elements.outfit.UiOutfitLine;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogOutfitsGeneric;
   import visuals.ui.elements.outfit.SymbolOutfitLineGeneric;
   
   public class DialogOutfits extends UiDialog
   {
      
      private static const MAX_LINES:int = 7;
      
      private static const SCROLL_VALUE:int = 2;
       
      
      private var _outfitContent:UiOutfitContent;
      
      private var _lines:Vector.<UiOutfitLine> = null;
      
      private var _offset:int = 0;
      
      private var _currentOutfit:Outfit = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _outfits:Vector.<Outfit>;
      
      public function DialogOutfits()
      {
         var _loc2_:int = 0;
         var _loc1_:SymbolDialogOutfitsGeneric = new SymbolDialogOutfitsGeneric();
         super(_loc1_);
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/outfits/title");
         _outfitContent = new UiOutfitContent(_loc1_.outfitContent,refresh);
         _lines = new Vector.<UiOutfitLine>();
         _loc2_ = 1;
         while(_loc2_ <= 7)
         {
            _lines.push(new UiOutfitLine(_loc1_.getChildByName("line" + _loc2_) as SymbolOutfitLineGeneric,_loc2_,onSelectLine,onUnlockOutfit));
            _loc2_++;
         }
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnScrollUp = new UiButton(_loc1_.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_loc1_.btnDown,"",onClickScrollDown);
         onMouseWheel.add(handleMouseWheel);
         refresh();
      }
      
      override public function show() : void
      {
         super.show();
         if(User.current.character.outfits.outfits.length == 0)
         {
            Environment.application.sendActionRequest("createInitialOutfit",{},handleRequests);
         }
      }
      
      private function onUnlockOutfit() : void
      {
         Environment.application.sendActionRequest("unlockNewOutfit",{},handleRequests);
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         if(_btnClose == null)
         {
            return;
         }
         _outfitContent.dispose();
         _outfitContent = null;
         _loc1_ = 0;
         while(_loc1_ < _lines.length)
         {
            _lines[_loc1_].dispose();
            _loc1_++;
         }
         _lines.length = 0;
         _lines = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _outfits.length = 0;
         _outfits = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onSelectLine(param1:UiOutfitLine) : void
      {
         var _loc2_:int = 0;
         if(param1 && param1.outfit)
         {
            _currentOutfit = param1.outfit;
         }
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].highlight(_currentOutfit == _lines[_loc2_].outfit);
            _loc2_++;
         }
         if(!_currentOutfit)
         {
            return;
         }
         _outfitContent.refresh(_currentOutfit);
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(1,true);
         }
         else
         {
            scrollDown(1,true);
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(2,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(2,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         if(_offset == 0)
         {
            return;
         }
         _offset = _offset - param1;
         if(_offset < 0)
         {
            _offset = 0;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         var _loc3_:int = 0;
         if(_outfits.length <= CConstant.max_outfits)
         {
            _loc3_ = _outfits.length - 7 + 1;
         }
         else if(_outfits.length >= CConstant.max_outfits)
         {
            _loc3_ = _outfits.length - 7;
         }
         if(_offset == _loc3_)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > _loc3_)
         {
            _offset = _loc3_;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      public function refresh() : void
      {
         var _loc1_:* = null;
         if(!_outfits)
         {
            _outfits = new Vector.<Outfit>();
            _outfits.push(new DefaultOutfit());
         }
         else
         {
            _loc1_ = _outfits[0];
            _outfits.length = 0;
            _outfits.push(_loc1_);
         }
         var _loc5_:int = 0;
         var _loc4_:* = User.current.character.outfits.outfits;
         for each(var _loc2_ in User.current.character.outfits.outfits)
         {
            _outfits.push(_loc2_);
         }
         var _loc3_:SymbolDialogOutfitsGeneric = _vo as SymbolDialogOutfitsGeneric;
         _loc3_.txtInfo.text = LocText.current.text("dialog/outfits/outfits_count_info",_outfits.length - 1,CConstant.max_outfits);
         refreshList(true);
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(!_btnScrollDown)
         {
            return;
         }
         _btnScrollUp.visible = _outfits.length >= 7;
         _btnScrollDown.visible = _outfits.length >= 7;
         _btnScrollUp.buttonEnabled = _offset > 0;
         if(_outfits.length <= CConstant.max_outfits)
         {
            _btnScrollDown.buttonEnabled = _offset <= _outfits.length - 7;
         }
         else
         {
            _btnScrollDown.buttonEnabled = _offset < _outfits.length - 7;
         }
         _loc3_ = 0;
         while(_loc3_ < _lines.length)
         {
            _loc2_ = _outfits.length >= _offset + _loc3_ + 1?_outfits[_offset + _loc3_]:null;
            if(!_loc2_ && _outfits.length >= _offset + _loc3_ && _outfits.length <= CConstant.max_outfits)
            {
               _lines[_loc3_].refreshUnlock(_loc3_ + 1);
            }
            else
            {
               _lines[_loc3_].refresh(_loc2_,_loc3_ + 1);
            }
            _loc3_++;
         }
         if(_currentOutfit)
         {
            _loc3_ = 0;
            while(_loc3_ < _lines.length)
            {
               if(_lines[_loc3_].outfit && _lines[_loc3_].outfit == _currentOutfit)
               {
                  onSelectLine(_lines[_loc3_]);
                  break;
               }
               _loc3_++;
            }
         }
         else if(_lines[0].outfit && param1)
         {
            onSelectLine(_lines[0]);
         }
         if(!_currentOutfit)
         {
            return;
         }
         _outfitContent.refresh(_currentOutfit);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "createInitialOutfit":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "unlockNewOutfit":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(CConstant.outfit_unlock_cost);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
         }
      }
   }
}
