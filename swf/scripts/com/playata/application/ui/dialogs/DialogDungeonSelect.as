package com.playata.application.ui.dialogs
{
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.dungeon.UiDungeonButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDungeonSelectGeneric;
   
   public class DialogDungeonSelect extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnDungeon1:UiDungeonButton;
      
      private var _btnDungeon2:UiDungeonButton;
      
      private var _btnDungeon3:UiDungeonButton;
      
      public function DialogDungeonSelect(param1:Boolean = false)
      {
         var _loc4_:* = null;
         var _loc6_:SymbolDialogDungeonSelectGeneric = new SymbolDialogDungeonSelectGeneric();
         super(_loc6_);
         _queued = false;
         var _loc9_:Boolean = User.current.character.hasDungeonKey;
         if(_loc9_)
         {
            if(param1)
            {
               _loc6_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_key_found/title");
               _loc6_.txtInfo.text = LocText.current.text("dialog/dungeon_key_found/text");
            }
            else
            {
               _loc6_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_select/ticket_available_title");
               _loc6_.txtInfo.text = LocText.current.text("dialog/dungeon_select/ticket_available_text");
            }
         }
         else
         {
            _loc6_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_select/ticket_missing_title");
            _loc6_.txtInfo.text = LocText.current.text("dialog/dungeon_select/ticket_missing_text");
         }
         _btnClose = new UiButton(_loc6_.btnClose,"",onClickClose);
         _btnDungeon1 = new UiDungeonButton(_loc6_.photoDungeon1,onSelectDungeon);
         _btnDungeon2 = new UiDungeonButton(_loc6_.photoDungeon2,onSelectDungeon);
         _btnDungeon3 = new UiDungeonButton(_loc6_.photoDungeon3,onSelectDungeon);
         var _loc8_:Object = Constants.current.constant("dungeon_templates");
         var _loc5_:int = 0;
         var _loc7_:int = 1;
         var _loc13_:int = 0;
         var _loc12_:* = _loc8_;
         for(var _loc3_ in _loc8_)
         {
            _loc4_ = null;
            var _loc11_:int = 0;
            var _loc10_:* = _loc8_;
            for(var _loc2_ in _loc8_)
            {
               if(_loc8_[_loc2_]["levels"]["1"]["min_fans"] > _loc5_)
               {
                  if(_loc4_ == null)
                  {
                     _loc4_ = _loc2_;
                  }
                  else if(_loc8_[_loc2_]["levels"]["1"]["min_fans"] < _loc8_[_loc4_]["levels"]["1"]["min_fans"])
                  {
                     _loc4_ = _loc2_;
                  }
               }
            }
            _loc5_ = _loc8_[_loc4_]["levels"]["1"]["min_fans"];
            if(_loc7_ <= 3)
            {
               this["_btnDungeon" + _loc7_].refresh(_loc4_);
               _loc7_++;
               continue;
            }
            break;
         }
         if(_loc9_ && param1)
         {
            Environment.audio.playFX("event_convention_successful.mp3");
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnDungeon1.dispose();
         _btnDungeon1 = null;
         _btnDungeon2.dispose();
         _btnDungeon2 = null;
         _btnDungeon3.dispose();
         _btnDungeon3 = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onSelectDungeon(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogDungeonOpen((param1.target as UiDungeonButton).dungeonIdentifier));
         close();
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}
