package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarImagePlaceholderGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarGeneric;
   import visuals.ui.elements.battle.SymbolBattleHitpointBarGeneric;
   import visuals.ui.elements.battle.SymbolBattleSpotLightLeftGeneric;
   import visuals.ui.elements.battle.SymbolBattleSpotLightRightGeneric;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillsGeneric;
   import visuals.ui.elements.icons.SymbolIconLevelStarGeneric;
   import visuals.ui.elements.stats.SymbolStatsGeneric;
   
   public class SymbolPanelBattleGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelBattle = null;
      
      public var background:SymbolDummyGeneric = null;
      
      public var spotLightA:SymbolBattleSpotLightLeftGeneric = null;
      
      public var spotLightB:SymbolBattleSpotLightRightGeneric = null;
      
      public var battleAvatarB:SymbolBattleAvatarGeneric = null;
      
      public var battleAvatarA:SymbolBattleAvatarGeneric = null;
      
      public var txtGuildBName:ILabelArea = null;
      
      public var txtGuildBCurrentCharacter:ILabelArea = null;
      
      public var txtGuildBCharacters:ILabelArea = null;
      
      public var txtGuildAName:ILabelArea = null;
      
      public var txtGuildACurrentCharacter:ILabelArea = null;
      
      public var txtGuildACharacters:ILabelArea = null;
      
      public var txtPlayerNameB:ILabelArea = null;
      
      public var txtPlayerNameA:ILabelArea = null;
      
      public var hitpointBarB:SymbolBattleHitpointBarGeneric = null;
      
      public var hitpointBarA:SymbolBattleHitpointBarGeneric = null;
      
      public var skillsA:SymbolBattleSkillsGeneric = null;
      
      public var skillsB:SymbolBattleSkillsGeneric = null;
      
      public var statsB:SymbolStatsGeneric = null;
      
      public var statsA:SymbolStatsGeneric = null;
      
      public var txtPlayerLevelA:ILabelArea = null;
      
      public var iconPlayerLevelA:SymbolIconLevelStarGeneric = null;
      
      public var txtPlayerLevelB:ILabelArea = null;
      
      public var iconPlayerLevelB:SymbolIconLevelStarGeneric = null;
      
      public var btnSkip:SymbolUiButtonDefaultGeneric = null;
      
      public var btnSkipMember:SymbolUiButtonDefaultGeneric = null;
      
      public var btnMyCharacter:SymbolUiButtonDefaultGeneric = null;
      
      public var avatarImageA:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var avatarImageB:SymbolAvatarImagePlaceholderGeneric = null;
      
      public function SymbolPanelBattleGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelBattle;
         }
         else
         {
            _nativeObject = new SymbolPanelBattle();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolDummyGeneric(_nativeObject.background);
         spotLightA = new SymbolBattleSpotLightLeftGeneric(_nativeObject.spotLightA);
         spotLightB = new SymbolBattleSpotLightRightGeneric(_nativeObject.spotLightB);
         battleAvatarB = new SymbolBattleAvatarGeneric(_nativeObject.battleAvatarB);
         battleAvatarA = new SymbolBattleAvatarGeneric(_nativeObject.battleAvatarA);
         txtGuildBName = FlashLabelArea.fromNative(_nativeObject.txtGuildBName);
         txtGuildBCurrentCharacter = FlashLabelArea.fromNative(_nativeObject.txtGuildBCurrentCharacter);
         txtGuildBCharacters = FlashLabelArea.fromNative(_nativeObject.txtGuildBCharacters);
         txtGuildAName = FlashLabelArea.fromNative(_nativeObject.txtGuildAName);
         txtGuildACurrentCharacter = FlashLabelArea.fromNative(_nativeObject.txtGuildACurrentCharacter);
         txtGuildACharacters = FlashLabelArea.fromNative(_nativeObject.txtGuildACharacters);
         txtPlayerNameB = FlashLabelArea.fromNative(_nativeObject.txtPlayerNameB);
         txtPlayerNameA = FlashLabelArea.fromNative(_nativeObject.txtPlayerNameA);
         hitpointBarB = new SymbolBattleHitpointBarGeneric(_nativeObject.hitpointBarB);
         hitpointBarA = new SymbolBattleHitpointBarGeneric(_nativeObject.hitpointBarA);
         skillsA = new SymbolBattleSkillsGeneric(_nativeObject.skillsA);
         skillsB = new SymbolBattleSkillsGeneric(_nativeObject.skillsB);
         statsB = new SymbolStatsGeneric(_nativeObject.statsB);
         statsA = new SymbolStatsGeneric(_nativeObject.statsA);
         txtPlayerLevelA = FlashLabelArea.fromNative(_nativeObject.txtPlayerLevelA);
         iconPlayerLevelA = new SymbolIconLevelStarGeneric(_nativeObject.iconPlayerLevelA);
         txtPlayerLevelB = FlashLabelArea.fromNative(_nativeObject.txtPlayerLevelB);
         iconPlayerLevelB = new SymbolIconLevelStarGeneric(_nativeObject.iconPlayerLevelB);
         btnSkip = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSkip);
         btnSkipMember = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSkipMember);
         btnMyCharacter = new SymbolUiButtonDefaultGeneric(_nativeObject.btnMyCharacter);
         avatarImageA = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.avatarImageA);
         avatarImageB = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.avatarImageB);
      }
      
      public function setNativeInstance(param1:SymbolPanelBattle) : void
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
         if(_nativeObject.spotLightA)
         {
            spotLightA.setNativeInstance(_nativeObject.spotLightA);
         }
         if(_nativeObject.spotLightB)
         {
            spotLightB.setNativeInstance(_nativeObject.spotLightB);
         }
         if(_nativeObject.battleAvatarB)
         {
            battleAvatarB.setNativeInstance(_nativeObject.battleAvatarB);
         }
         if(_nativeObject.battleAvatarA)
         {
            battleAvatarA.setNativeInstance(_nativeObject.battleAvatarA);
         }
         FlashLabelArea.setNativeInstance(txtGuildBName,_nativeObject.txtGuildBName);
         FlashLabelArea.setNativeInstance(txtGuildBCurrentCharacter,_nativeObject.txtGuildBCurrentCharacter);
         FlashLabelArea.setNativeInstance(txtGuildBCharacters,_nativeObject.txtGuildBCharacters);
         FlashLabelArea.setNativeInstance(txtGuildAName,_nativeObject.txtGuildAName);
         FlashLabelArea.setNativeInstance(txtGuildACurrentCharacter,_nativeObject.txtGuildACurrentCharacter);
         FlashLabelArea.setNativeInstance(txtGuildACharacters,_nativeObject.txtGuildACharacters);
         FlashLabelArea.setNativeInstance(txtPlayerNameB,_nativeObject.txtPlayerNameB);
         FlashLabelArea.setNativeInstance(txtPlayerNameA,_nativeObject.txtPlayerNameA);
         if(_nativeObject.hitpointBarB)
         {
            hitpointBarB.setNativeInstance(_nativeObject.hitpointBarB);
         }
         if(_nativeObject.hitpointBarA)
         {
            hitpointBarA.setNativeInstance(_nativeObject.hitpointBarA);
         }
         if(_nativeObject.skillsA)
         {
            skillsA.setNativeInstance(_nativeObject.skillsA);
         }
         if(_nativeObject.skillsB)
         {
            skillsB.setNativeInstance(_nativeObject.skillsB);
         }
         if(_nativeObject.statsB)
         {
            statsB.setNativeInstance(_nativeObject.statsB);
         }
         if(_nativeObject.statsA)
         {
            statsA.setNativeInstance(_nativeObject.statsA);
         }
         FlashLabelArea.setNativeInstance(txtPlayerLevelA,_nativeObject.txtPlayerLevelA);
         if(_nativeObject.iconPlayerLevelA)
         {
            iconPlayerLevelA.setNativeInstance(_nativeObject.iconPlayerLevelA);
         }
         FlashLabelArea.setNativeInstance(txtPlayerLevelB,_nativeObject.txtPlayerLevelB);
         if(_nativeObject.iconPlayerLevelB)
         {
            iconPlayerLevelB.setNativeInstance(_nativeObject.iconPlayerLevelB);
         }
         if(_nativeObject.btnSkip)
         {
            btnSkip.setNativeInstance(_nativeObject.btnSkip);
         }
         if(_nativeObject.btnSkipMember)
         {
            btnSkipMember.setNativeInstance(_nativeObject.btnSkipMember);
         }
         if(_nativeObject.btnMyCharacter)
         {
            btnMyCharacter.setNativeInstance(_nativeObject.btnMyCharacter);
         }
         if(_nativeObject.avatarImageA)
         {
            avatarImageA.setNativeInstance(_nativeObject.avatarImageA);
         }
         if(_nativeObject.avatarImageB)
         {
            avatarImageB.setNativeInstance(_nativeObject.avatarImageB);
         }
      }
   }
}
