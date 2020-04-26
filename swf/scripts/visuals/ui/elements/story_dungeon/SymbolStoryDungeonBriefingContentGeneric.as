package visuals.ui.elements.story_dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonInstantFinishGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolStoryDungeonBriefingContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStoryDungeonBriefingContent = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var reward:SymbolStoryDungeonRewardGeneric = null;
      
      public var txtProgressCaption:ILabel = null;
      
      public var boss:SymbolStoryDungeonUnlockBossGeneric = null;
      
      public var progressBar:SymbolStoryDungeonProgressBarGeneric = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var btnInstantFinishBattle:SymbolButtonPremiumGeneric = null;
      
      public var btnInstantFinish:SymbolButtonInstantFinishGeneric = null;
      
      public var txtCooldown:ILabelArea = null;
      
      public function SymbolStoryDungeonBriefingContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStoryDungeonBriefingContent;
         }
         else
         {
            _nativeObject = new SymbolStoryDungeonBriefingContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         reward = new SymbolStoryDungeonRewardGeneric(_nativeObject.reward);
         txtProgressCaption = FlashLabel.fromNative(_nativeObject.txtProgressCaption);
         boss = new SymbolStoryDungeonUnlockBossGeneric(_nativeObject.boss);
         progressBar = new SymbolStoryDungeonProgressBarGeneric(_nativeObject.progressBar);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         btnInstantFinishBattle = new SymbolButtonPremiumGeneric(_nativeObject.btnInstantFinishBattle);
         btnInstantFinish = new SymbolButtonInstantFinishGeneric(_nativeObject.btnInstantFinish);
         txtCooldown = FlashLabelArea.fromNative(_nativeObject.txtCooldown);
      }
      
      public function setNativeInstance(param1:SymbolStoryDungeonBriefingContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.reward)
         {
            reward.setNativeInstance(_nativeObject.reward);
         }
         FlashLabel.setNativeInstance(txtProgressCaption,_nativeObject.txtProgressCaption);
         if(_nativeObject.boss)
         {
            boss.setNativeInstance(_nativeObject.boss);
         }
         if(_nativeObject.progressBar)
         {
            progressBar.setNativeInstance(_nativeObject.progressBar);
         }
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         if(_nativeObject.btnInstantFinishBattle)
         {
            btnInstantFinishBattle.setNativeInstance(_nativeObject.btnInstantFinishBattle);
         }
         if(_nativeObject.btnInstantFinish)
         {
            btnInstantFinish.setNativeInstance(_nativeObject.btnInstantFinish);
         }
         FlashLabelArea.setNativeInstance(txtCooldown,_nativeObject.txtCooldown);
      }
   }
}
