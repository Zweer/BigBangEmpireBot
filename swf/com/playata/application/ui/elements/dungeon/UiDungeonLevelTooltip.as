package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.data.dungeon.DungeonLevel;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiTooltipDungeonLevelGeneric;
   
   public class UiDungeonLevelTooltip extends UiClosableTooltip
   {
      
      protected static var _tooltipContent:SymbolUiTooltipDungeonLevelGeneric = null;
      
      private static var _currentDungeonLevel:DungeonLevel = null;
      
      private static var _currentMissionsRemaining:int = -1;
       
      
      private var _dungeonLevel:DungeonLevel = null;
      
      private var _missionsRemaining:int = -1;
      
      private var _interactiveDisplayObject:IInteractiveDisplayObject = null;
      
      public function UiDungeonLevelTooltip(param1:IDisplayObject)
      {
         if(param1 is IInteractiveDisplayObject)
         {
            _interactiveDisplayObject = param1 as IInteractiveDisplayObject;
         }
         else if(param1)
         {
            _interactiveDisplayObject = new InteractiveDisplayObject(param1);
         }
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiTooltipDungeonLevelGeneric();
            _tooltipContent.title.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
            _tooltipContent.tooltip.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
            _tooltipContent.txtRequirements.text = LocText.current.text("dialog/dungeon_status/tooltip_level_requirements_title");
         }
         _tooltipContent.visible = false;
         super(_interactiveDisplayObject,_tooltipContent);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function onAssigned() : void
      {
         if(_currentDungeonLevel == _dungeonLevel && _currentMissionsRemaining == _missionsRemaining)
         {
            return;
         }
         _currentDungeonLevel = _dungeonLevel;
         _currentMissionsRemaining = _missionsRemaining;
         if(_currentDungeonLevel == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         _tooltipContent.visible = true;
         _tooltipContent.title.text = LocText.current.text("dialog/dungeon_status/tooltip_level_title",_currentDungeonLevel.level);
         if(_currentDungeonLevel.isFinished)
         {
            _tooltipContent.tooltip.text = LocText.current.text("dialog/dungeon_status/tooltip_level_completed");
         }
         else if(!_currentDungeonLevel.isUnlocked)
         {
            _tooltipContent.tooltip.text = LocText.current.text("dialog/dungeon_status/tooltip_level_locked");
         }
         else
         {
            _tooltipContent.tooltip.text = LocText.current.text("dialog/dungeon_status/tooltip_level_progress",_currentMissionsRemaining);
         }
         _tooltipContent.txtFans.text = LocText.current.formatHugeNumber(_currentDungeonLevel.fansNeeded);
         var _loc1_:Number = Math.round(_tooltipContent.title.y + _tooltipContent.title.textHeight + 5);
         _tooltipContent.tooltip.y = _loc1_;
         _loc1_ = Math.round(_loc1_ + _tooltipContent.tooltip.textHeight + 10);
         _tooltipContent.txtRequirements.y = _loc1_;
         _loc1_ = _loc1_ + (_tooltipContent.txtRequirements.textHeight + 5);
         _tooltipContent.iconFans.y = _loc1_;
         _tooltipContent.txtFans.y = _loc1_ + 2;
         _loc1_ = _loc1_ + 55;
         _tooltipContent.background.height = _loc1_;
      }
      
      public function update(param1:DungeonLevel, param2:int) : void
      {
         _dungeonLevel = param1;
         _missionsRemaining = param2;
      }
   }
}
