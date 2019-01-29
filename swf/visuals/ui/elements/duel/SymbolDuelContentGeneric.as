package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolIconButtonCharacterGeneric;
   import visuals.ui.base.SymbolIconButtonRefreshDuelEnemiesGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.bonus.SymbolDailyBonusGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPlusStaticGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolDuelContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDuelContent = null;
      
      public var bg:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnAttack:SymbolButtonPremiumGeneric = null;
      
      public var enemyLine1:SymbolDuelEnemyLineGeneric = null;
      
      public var enemyLine2:SymbolDuelEnemyLineGeneric = null;
      
      public var enemyLine3:SymbolDuelEnemyLineGeneric = null;
      
      public var enemyLine4:SymbolDuelEnemyLineGeneric = null;
      
      public var enemyLine5:SymbolDuelEnemyLineGeneric = null;
      
      public var enemyLine6:SymbolDuelEnemyLineGeneric = null;
      
      public var enemyLine7:SymbolDuelEnemyLineGeneric = null;
      
      public var enemyLine8:SymbolDuelEnemyLineGeneric = null;
      
      public var enemyLine9:SymbolDuelEnemyLineGeneric = null;
      
      public var dailyBonusDuel:SymbolDailyBonusGeneric = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtHonorCaption:ILabel = null;
      
      public var btnViewPlayer:SymbolIconButtonCharacterGeneric = null;
      
      public var btnRefreshDuelEnemies:SymbolIconButtonRefreshDuelEnemiesGeneric = null;
      
      public var duelEnemiesRefreshHint:SymbolSidePremiumHintGeneric = null;
      
      public var duelStaminaBar:SymbolDuelStaminaBarGeneric = null;
      
      public var avatars:SymbolDuelAvatarsGeneric = null;
      
      public var btnRefillDuelStamina:SymbolButtonPlusStaticGeneric = null;
      
      public var duelStaminaRefillHint:SymbolSidePremiumHintGeneric = null;
      
      public var txtDuelStamina:ILabel = null;
      
      public var txtTimeToDuelStaminaRefill:ILabel = null;
      
      public function SymbolDuelContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDuelContent;
         }
         else
         {
            _nativeObject = new SymbolDuelContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.bg);
         btnAttack = new SymbolButtonPremiumGeneric(_nativeObject.btnAttack);
         enemyLine1 = new SymbolDuelEnemyLineGeneric(_nativeObject.enemyLine1);
         enemyLine2 = new SymbolDuelEnemyLineGeneric(_nativeObject.enemyLine2);
         enemyLine3 = new SymbolDuelEnemyLineGeneric(_nativeObject.enemyLine3);
         enemyLine4 = new SymbolDuelEnemyLineGeneric(_nativeObject.enemyLine4);
         enemyLine5 = new SymbolDuelEnemyLineGeneric(_nativeObject.enemyLine5);
         enemyLine6 = new SymbolDuelEnemyLineGeneric(_nativeObject.enemyLine6);
         enemyLine7 = new SymbolDuelEnemyLineGeneric(_nativeObject.enemyLine7);
         enemyLine8 = new SymbolDuelEnemyLineGeneric(_nativeObject.enemyLine8);
         enemyLine9 = new SymbolDuelEnemyLineGeneric(_nativeObject.enemyLine9);
         dailyBonusDuel = new SymbolDailyBonusGeneric(_nativeObject.dailyBonusDuel);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtHonorCaption = FlashLabel.fromNative(_nativeObject.txtHonorCaption);
         btnViewPlayer = new SymbolIconButtonCharacterGeneric(_nativeObject.btnViewPlayer);
         btnRefreshDuelEnemies = new SymbolIconButtonRefreshDuelEnemiesGeneric(_nativeObject.btnRefreshDuelEnemies);
         duelEnemiesRefreshHint = new SymbolSidePremiumHintGeneric(_nativeObject.duelEnemiesRefreshHint);
         duelStaminaBar = new SymbolDuelStaminaBarGeneric(_nativeObject.duelStaminaBar);
         avatars = new SymbolDuelAvatarsGeneric(_nativeObject.avatars);
         btnRefillDuelStamina = new SymbolButtonPlusStaticGeneric(_nativeObject.btnRefillDuelStamina);
         duelStaminaRefillHint = new SymbolSidePremiumHintGeneric(_nativeObject.duelStaminaRefillHint);
         txtDuelStamina = FlashLabel.fromNative(_nativeObject.txtDuelStamina);
         txtTimeToDuelStaminaRefill = FlashLabel.fromNative(_nativeObject.txtTimeToDuelStaminaRefill);
      }
      
      public function setNativeInstance(param1:SymbolDuelContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.btnAttack)
         {
            btnAttack.setNativeInstance(_nativeObject.btnAttack);
         }
         if(_nativeObject.enemyLine1)
         {
            enemyLine1.setNativeInstance(_nativeObject.enemyLine1);
         }
         if(_nativeObject.enemyLine2)
         {
            enemyLine2.setNativeInstance(_nativeObject.enemyLine2);
         }
         if(_nativeObject.enemyLine3)
         {
            enemyLine3.setNativeInstance(_nativeObject.enemyLine3);
         }
         if(_nativeObject.enemyLine4)
         {
            enemyLine4.setNativeInstance(_nativeObject.enemyLine4);
         }
         if(_nativeObject.enemyLine5)
         {
            enemyLine5.setNativeInstance(_nativeObject.enemyLine5);
         }
         if(_nativeObject.enemyLine6)
         {
            enemyLine6.setNativeInstance(_nativeObject.enemyLine6);
         }
         if(_nativeObject.enemyLine7)
         {
            enemyLine7.setNativeInstance(_nativeObject.enemyLine7);
         }
         if(_nativeObject.enemyLine8)
         {
            enemyLine8.setNativeInstance(_nativeObject.enemyLine8);
         }
         if(_nativeObject.enemyLine9)
         {
            enemyLine9.setNativeInstance(_nativeObject.enemyLine9);
         }
         if(_nativeObject.dailyBonusDuel)
         {
            dailyBonusDuel.setNativeInstance(_nativeObject.dailyBonusDuel);
         }
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabel.setNativeInstance(txtHonorCaption,_nativeObject.txtHonorCaption);
         if(_nativeObject.btnViewPlayer)
         {
            btnViewPlayer.setNativeInstance(_nativeObject.btnViewPlayer);
         }
         if(_nativeObject.btnRefreshDuelEnemies)
         {
            btnRefreshDuelEnemies.setNativeInstance(_nativeObject.btnRefreshDuelEnemies);
         }
         if(_nativeObject.duelEnemiesRefreshHint)
         {
            duelEnemiesRefreshHint.setNativeInstance(_nativeObject.duelEnemiesRefreshHint);
         }
         if(_nativeObject.duelStaminaBar)
         {
            duelStaminaBar.setNativeInstance(_nativeObject.duelStaminaBar);
         }
         if(_nativeObject.avatars)
         {
            avatars.setNativeInstance(_nativeObject.avatars);
         }
         if(_nativeObject.btnRefillDuelStamina)
         {
            btnRefillDuelStamina.setNativeInstance(_nativeObject.btnRefillDuelStamina);
         }
         if(_nativeObject.duelStaminaRefillHint)
         {
            duelStaminaRefillHint.setNativeInstance(_nativeObject.duelStaminaRefillHint);
         }
         FlashLabel.setNativeInstance(txtDuelStamina,_nativeObject.txtDuelStamina);
         FlashLabel.setNativeInstance(txtTimeToDuelStaminaRefill,_nativeObject.txtTimeToDuelStaminaRefill);
      }
   }
}
