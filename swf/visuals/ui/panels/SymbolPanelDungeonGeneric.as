package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonMapGeneric;
   import visuals.ui.elements.buttons.SymbolButtonQuestMultitaskingGeneric;
   import visuals.ui.elements.conventions.SymbolButtonConventionMultitaskingGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonContentGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonPanelTimeGeneric;
   import visuals.ui.elements.quest.SymbolButtonDungeonStatusGeneric;
   
   public class SymbolPanelDungeonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelDungeon = null;
      
      public var dungeonContent:SymbolDungeonContentGeneric = null;
      
      public var timeLeft:SymbolDungeonPanelTimeGeneric = null;
      
      public var txtName:ILabel = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var btnCitymap:SymbolButtonMapGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var btnDungeonStatus:SymbolButtonDungeonStatusGeneric = null;
      
      public var btnQuestMultitasking:SymbolButtonQuestMultitaskingGeneric = null;
      
      public var btnConventionMultitasking:SymbolButtonConventionMultitaskingGeneric = null;
      
      public function SymbolPanelDungeonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelDungeon;
         }
         else
         {
            _nativeObject = new SymbolPanelDungeon();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dungeonContent = new SymbolDungeonContentGeneric(_nativeObject.dungeonContent);
         timeLeft = new SymbolDungeonPanelTimeGeneric(_nativeObject.timeLeft);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         btnCitymap = new SymbolButtonMapGeneric(_nativeObject.btnCitymap);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         btnDungeonStatus = new SymbolButtonDungeonStatusGeneric(_nativeObject.btnDungeonStatus);
         btnQuestMultitasking = new SymbolButtonQuestMultitaskingGeneric(_nativeObject.btnQuestMultitasking);
         btnConventionMultitasking = new SymbolButtonConventionMultitaskingGeneric(_nativeObject.btnConventionMultitasking);
      }
      
      public function setNativeInstance(param1:SymbolPanelDungeon) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dungeonContent)
         {
            dungeonContent.setNativeInstance(_nativeObject.dungeonContent);
         }
         if(_nativeObject.timeLeft)
         {
            timeLeft.setNativeInstance(_nativeObject.timeLeft);
         }
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         if(_nativeObject.btnCitymap)
         {
            btnCitymap.setNativeInstance(_nativeObject.btnCitymap);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.btnDungeonStatus)
         {
            btnDungeonStatus.setNativeInstance(_nativeObject.btnDungeonStatus);
         }
         if(_nativeObject.btnQuestMultitasking)
         {
            btnQuestMultitasking.setNativeInstance(_nativeObject.btnQuestMultitasking);
         }
         if(_nativeObject.btnConventionMultitasking)
         {
            btnConventionMultitasking.setNativeInstance(_nativeObject.btnConventionMultitasking);
         }
      }
   }
}
