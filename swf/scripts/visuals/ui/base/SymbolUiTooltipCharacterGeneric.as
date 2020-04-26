package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.battle_skills.SymbolTooltipCharacterBattleSkillsGeneric;
   import visuals.ui.elements.generic.SymbolTooltipStatsGeneric;
   
   public class SymbolUiTooltipCharacterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiTooltipCharacter = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var tooltipTop:ILabelArea = null;
      
      public var tooltipBottom:ILabelArea = null;
      
      public var battleSkills:SymbolTooltipCharacterBattleSkillsGeneric = null;
      
      public var stats:SymbolTooltipStatsGeneric = null;
      
      public function SymbolUiTooltipCharacterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiTooltipCharacter;
         }
         else
         {
            _nativeObject = new SymbolUiTooltipCharacter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         tooltipTop = FlashLabelArea.fromNative(_nativeObject.tooltipTop);
         tooltipBottom = FlashLabelArea.fromNative(_nativeObject.tooltipBottom);
         battleSkills = new SymbolTooltipCharacterBattleSkillsGeneric(_nativeObject.battleSkills);
         stats = new SymbolTooltipStatsGeneric(_nativeObject.stats);
      }
      
      public function setNativeInstance(param1:SymbolUiTooltipCharacter) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         FlashLabelArea.setNativeInstance(tooltipTop,_nativeObject.tooltipTop);
         FlashLabelArea.setNativeInstance(tooltipBottom,_nativeObject.tooltipBottom);
         if(_nativeObject.battleSkills)
         {
            battleSkills.setNativeInstance(_nativeObject.battleSkills);
         }
         if(_nativeObject.stats)
         {
            stats.setNativeInstance(_nativeObject.stats);
         }
      }
   }
}
