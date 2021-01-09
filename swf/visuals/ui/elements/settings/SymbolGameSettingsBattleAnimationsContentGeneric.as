package visuals.ui.elements.settings
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   
   public class SymbolGameSettingsBattleAnimationsContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGameSettingsBattleAnimationsContent = null;
      
      public var txtShowGuildBattles:ILabelArea = null;
      
      public var checkShowGuildBattles:SymbolUiCheckboxGeneric = null;
      
      public var checkShowStoryDungeonBattles:SymbolUiCheckboxGeneric = null;
      
      public var txtShowStoryDungeonBattles:ILabelArea = null;
      
      public var checkShowDuelBattles:SymbolUiCheckboxGeneric = null;
      
      public var txtShowDuelBattles:ILabelArea = null;
      
      public var txtShowFightMissionBattles:ILabelArea = null;
      
      public var checkShowFightMissionBattles:SymbolUiCheckboxGeneric = null;
      
      public var txtShowDungeonBattles:ILabelArea = null;
      
      public var checkShowDungeonBattles:SymbolUiCheckboxGeneric = null;
      
      public var txtShowMovieBattles:ILabelArea = null;
      
      public var checkShowMovieBattles:SymbolUiCheckboxGeneric = null;
      
      public function SymbolGameSettingsBattleAnimationsContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGameSettingsBattleAnimationsContent;
         }
         else
         {
            _nativeObject = new SymbolGameSettingsBattleAnimationsContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtShowGuildBattles = FlashLabelArea.fromNative(_nativeObject.txtShowGuildBattles);
         checkShowGuildBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowGuildBattles);
         checkShowStoryDungeonBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowStoryDungeonBattles);
         txtShowStoryDungeonBattles = FlashLabelArea.fromNative(_nativeObject.txtShowStoryDungeonBattles);
         checkShowDuelBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowDuelBattles);
         txtShowDuelBattles = FlashLabelArea.fromNative(_nativeObject.txtShowDuelBattles);
         txtShowFightMissionBattles = FlashLabelArea.fromNative(_nativeObject.txtShowFightMissionBattles);
         checkShowFightMissionBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowFightMissionBattles);
         txtShowDungeonBattles = FlashLabelArea.fromNative(_nativeObject.txtShowDungeonBattles);
         checkShowDungeonBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowDungeonBattles);
         txtShowMovieBattles = FlashLabelArea.fromNative(_nativeObject.txtShowMovieBattles);
         checkShowMovieBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowMovieBattles);
      }
      
      public function setNativeInstance(param1:SymbolGameSettingsBattleAnimationsContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtShowGuildBattles,_nativeObject.txtShowGuildBattles);
         if(_nativeObject.checkShowGuildBattles)
         {
            checkShowGuildBattles.setNativeInstance(_nativeObject.checkShowGuildBattles);
         }
         if(_nativeObject.checkShowStoryDungeonBattles)
         {
            checkShowStoryDungeonBattles.setNativeInstance(_nativeObject.checkShowStoryDungeonBattles);
         }
         FlashLabelArea.setNativeInstance(txtShowStoryDungeonBattles,_nativeObject.txtShowStoryDungeonBattles);
         if(_nativeObject.checkShowDuelBattles)
         {
            checkShowDuelBattles.setNativeInstance(_nativeObject.checkShowDuelBattles);
         }
         FlashLabelArea.setNativeInstance(txtShowDuelBattles,_nativeObject.txtShowDuelBattles);
         FlashLabelArea.setNativeInstance(txtShowFightMissionBattles,_nativeObject.txtShowFightMissionBattles);
         if(_nativeObject.checkShowFightMissionBattles)
         {
            checkShowFightMissionBattles.setNativeInstance(_nativeObject.checkShowFightMissionBattles);
         }
         FlashLabelArea.setNativeInstance(txtShowDungeonBattles,_nativeObject.txtShowDungeonBattles);
         if(_nativeObject.checkShowDungeonBattles)
         {
            checkShowDungeonBattles.setNativeInstance(_nativeObject.checkShowDungeonBattles);
         }
         FlashLabelArea.setNativeInstance(txtShowMovieBattles,_nativeObject.txtShowMovieBattles);
         if(_nativeObject.checkShowMovieBattles)
         {
            checkShowMovieBattles.setNativeInstance(_nativeObject.checkShowMovieBattles);
         }
      }
   }
}
