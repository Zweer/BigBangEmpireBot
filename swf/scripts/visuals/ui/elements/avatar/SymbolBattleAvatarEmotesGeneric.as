package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconBangGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconBonesGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconCloudGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconCryBabyGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconFlash1Generic;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconFlash2Generic;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconFlash3Generic;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconKnuckleGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconLassoGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconQuestionGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconShitGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconSkullGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconSwirl1Generic;
   import visuals.ui.elements.battle.SymbolBattleAvatarEmoteIconSwirl2Generic;
   
   public class SymbolBattleAvatarEmotesGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleAvatarEmotes = null;
      
      public var hint:SymbolEmotesBubbleHintGeneric = null;
      
      public var question:SymbolBattleAvatarEmoteIconQuestionGeneric = null;
      
      public var skull:SymbolBattleAvatarEmoteIconSkullGeneric = null;
      
      public var cryBaby:SymbolBattleAvatarEmoteIconCryBabyGeneric = null;
      
      public var shit:SymbolBattleAvatarEmoteIconShitGeneric = null;
      
      public var bones:SymbolBattleAvatarEmoteIconBonesGeneric = null;
      
      public var knuckle:SymbolBattleAvatarEmoteIconKnuckleGeneric = null;
      
      public var swirl2:SymbolBattleAvatarEmoteIconSwirl2Generic = null;
      
      public var cloud:SymbolBattleAvatarEmoteIconCloudGeneric = null;
      
      public var bang:SymbolBattleAvatarEmoteIconBangGeneric = null;
      
      public var swirl1:SymbolBattleAvatarEmoteIconSwirl1Generic = null;
      
      public var flash1:SymbolBattleAvatarEmoteIconFlash1Generic = null;
      
      public var flash3:SymbolBattleAvatarEmoteIconFlash3Generic = null;
      
      public var flash2:SymbolBattleAvatarEmoteIconFlash2Generic = null;
      
      public var lasso:SymbolBattleAvatarEmoteIconLassoGeneric = null;
      
      public function SymbolBattleAvatarEmotesGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleAvatarEmotes;
         }
         else
         {
            _nativeObject = new SymbolBattleAvatarEmotes();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         hint = new SymbolEmotesBubbleHintGeneric(_nativeObject.hint);
         question = new SymbolBattleAvatarEmoteIconQuestionGeneric(_nativeObject.question);
         skull = new SymbolBattleAvatarEmoteIconSkullGeneric(_nativeObject.skull);
         cryBaby = new SymbolBattleAvatarEmoteIconCryBabyGeneric(_nativeObject.cryBaby);
         shit = new SymbolBattleAvatarEmoteIconShitGeneric(_nativeObject.shit);
         bones = new SymbolBattleAvatarEmoteIconBonesGeneric(_nativeObject.bones);
         knuckle = new SymbolBattleAvatarEmoteIconKnuckleGeneric(_nativeObject.knuckle);
         swirl2 = new SymbolBattleAvatarEmoteIconSwirl2Generic(_nativeObject.swirl2);
         cloud = new SymbolBattleAvatarEmoteIconCloudGeneric(_nativeObject.cloud);
         bang = new SymbolBattleAvatarEmoteIconBangGeneric(_nativeObject.bang);
         swirl1 = new SymbolBattleAvatarEmoteIconSwirl1Generic(_nativeObject.swirl1);
         flash1 = new SymbolBattleAvatarEmoteIconFlash1Generic(_nativeObject.flash1);
         flash3 = new SymbolBattleAvatarEmoteIconFlash3Generic(_nativeObject.flash3);
         flash2 = new SymbolBattleAvatarEmoteIconFlash2Generic(_nativeObject.flash2);
         lasso = new SymbolBattleAvatarEmoteIconLassoGeneric(_nativeObject.lasso);
      }
      
      public function setNativeInstance(param1:SymbolBattleAvatarEmotes) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.hint)
         {
            hint.setNativeInstance(_nativeObject.hint);
         }
         if(_nativeObject.question)
         {
            question.setNativeInstance(_nativeObject.question);
         }
         if(_nativeObject.skull)
         {
            skull.setNativeInstance(_nativeObject.skull);
         }
         if(_nativeObject.cryBaby)
         {
            cryBaby.setNativeInstance(_nativeObject.cryBaby);
         }
         if(_nativeObject.shit)
         {
            shit.setNativeInstance(_nativeObject.shit);
         }
         if(_nativeObject.bones)
         {
            bones.setNativeInstance(_nativeObject.bones);
         }
         if(_nativeObject.knuckle)
         {
            knuckle.setNativeInstance(_nativeObject.knuckle);
         }
         if(_nativeObject.swirl2)
         {
            swirl2.setNativeInstance(_nativeObject.swirl2);
         }
         if(_nativeObject.cloud)
         {
            cloud.setNativeInstance(_nativeObject.cloud);
         }
         if(_nativeObject.bang)
         {
            bang.setNativeInstance(_nativeObject.bang);
         }
         if(_nativeObject.swirl1)
         {
            swirl1.setNativeInstance(_nativeObject.swirl1);
         }
         if(_nativeObject.flash1)
         {
            flash1.setNativeInstance(_nativeObject.flash1);
         }
         if(_nativeObject.flash3)
         {
            flash3.setNativeInstance(_nativeObject.flash3);
         }
         if(_nativeObject.flash2)
         {
            flash2.setNativeInstance(_nativeObject.flash2);
         }
         if(_nativeObject.lasso)
         {
            lasso.setNativeInstance(_nativeObject.lasso);
         }
      }
   }
}
