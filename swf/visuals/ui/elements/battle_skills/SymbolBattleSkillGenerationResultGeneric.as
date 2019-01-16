package visuals.ui.elements.battle_skills
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolBattleSkillGenerationResultGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleSkillGenerationResult = null;
      
      public var bgOld:SymbolBackgroundScalableGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btn:SymbolUiButtonDefaultGeneric = null;
      
      public var txtNameSkill:ILabelArea = null;
      
      public var animationContainer:SymbolBattleSkillAnimationContainerGeneric = null;
      
      public var txtTitleSkill:ILabel = null;
      
      public function SymbolBattleSkillGenerationResultGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleSkillGenerationResult;
         }
         else
         {
            _nativeObject = new SymbolBattleSkillGenerationResult();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bgOld = new SymbolBackgroundScalableGeneric(_nativeObject.bgOld);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btn = new SymbolUiButtonDefaultGeneric(_nativeObject.btn);
         txtNameSkill = FlashLabelArea.fromNative(_nativeObject.txtNameSkill);
         animationContainer = new SymbolBattleSkillAnimationContainerGeneric(_nativeObject.animationContainer);
         txtTitleSkill = FlashLabel.fromNative(_nativeObject.txtTitleSkill);
      }
      
      public function setNativeInstance(param1:SymbolBattleSkillGenerationResult) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bgOld)
         {
            bgOld.setNativeInstance(_nativeObject.bgOld);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btn)
         {
            btn.setNativeInstance(_nativeObject.btn);
         }
         FlashLabelArea.setNativeInstance(txtNameSkill,_nativeObject.txtNameSkill);
         if(_nativeObject.animationContainer)
         {
            animationContainer.setNativeInstance(_nativeObject.animationContainer);
         }
         FlashLabel.setNativeInstance(txtTitleSkill,_nativeObject.txtTitleSkill);
      }
   }
}
