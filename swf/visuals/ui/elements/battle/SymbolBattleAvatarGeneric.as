package visuals.ui.elements.battle
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.avatar.SymbolAvatarIconAnimationGeneric;
   
   public class SymbolBattleAvatarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleAvatar = null;
      
      public var attackWooshB:SymbolBattleAttackWooshGeneric = null;
      
      public var attackWooshA:SymbolBattleAttackWooshGeneric = null;
      
      public var teamMissileThrowB:SymbolTeamMissileThrowGeneric = null;
      
      public var teamMissileThrowA:SymbolTeamMissileThrowGeneric = null;
      
      public var container:SymbolBattleAvatarContainerGeneric = null;
      
      public var teamMissileExplode:SymbolTeamMissileExplodeAnimationGeneric = null;
      
      public var dodgedDisplay:SymbolBattleAvatarDodgedDisplayGeneric = null;
      
      public var criticalDisplay:SymbolBattleAvatarCriticalDisplayGeneric = null;
      
      public var damageDisplay:SymbolBattleAvatarDamageDisplayGeneric = null;
      
      public var iconAnimation:SymbolAvatarIconAnimationGeneric = null;
      
      public function SymbolBattleAvatarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleAvatar;
         }
         else
         {
            _nativeObject = new SymbolBattleAvatar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         attackWooshB = new SymbolBattleAttackWooshGeneric(_nativeObject.attackWooshB);
         attackWooshA = new SymbolBattleAttackWooshGeneric(_nativeObject.attackWooshA);
         teamMissileThrowB = new SymbolTeamMissileThrowGeneric(_nativeObject.teamMissileThrowB);
         teamMissileThrowA = new SymbolTeamMissileThrowGeneric(_nativeObject.teamMissileThrowA);
         container = new SymbolBattleAvatarContainerGeneric(_nativeObject.container);
         teamMissileExplode = new SymbolTeamMissileExplodeAnimationGeneric(_nativeObject.teamMissileExplode);
         dodgedDisplay = new SymbolBattleAvatarDodgedDisplayGeneric(_nativeObject.dodgedDisplay);
         criticalDisplay = new SymbolBattleAvatarCriticalDisplayGeneric(_nativeObject.criticalDisplay);
         damageDisplay = new SymbolBattleAvatarDamageDisplayGeneric(_nativeObject.damageDisplay);
         iconAnimation = new SymbolAvatarIconAnimationGeneric(_nativeObject.iconAnimation);
      }
      
      public function setNativeInstance(param1:SymbolBattleAvatar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.attackWooshB)
         {
            attackWooshB.setNativeInstance(_nativeObject.attackWooshB);
         }
         if(_nativeObject.attackWooshA)
         {
            attackWooshA.setNativeInstance(_nativeObject.attackWooshA);
         }
         if(_nativeObject.teamMissileThrowB)
         {
            teamMissileThrowB.setNativeInstance(_nativeObject.teamMissileThrowB);
         }
         if(_nativeObject.teamMissileThrowA)
         {
            teamMissileThrowA.setNativeInstance(_nativeObject.teamMissileThrowA);
         }
         if(_nativeObject.container)
         {
            container.setNativeInstance(_nativeObject.container);
         }
         if(_nativeObject.teamMissileExplode)
         {
            teamMissileExplode.setNativeInstance(_nativeObject.teamMissileExplode);
         }
         if(_nativeObject.dodgedDisplay)
         {
            dodgedDisplay.setNativeInstance(_nativeObject.dodgedDisplay);
         }
         if(_nativeObject.criticalDisplay)
         {
            criticalDisplay.setNativeInstance(_nativeObject.criticalDisplay);
         }
         if(_nativeObject.damageDisplay)
         {
            damageDisplay.setNativeInstance(_nativeObject.damageDisplay);
         }
         if(_nativeObject.iconAnimation)
         {
            iconAnimation.setNativeInstance(_nativeObject.iconAnimation);
         }
      }
   }
}
