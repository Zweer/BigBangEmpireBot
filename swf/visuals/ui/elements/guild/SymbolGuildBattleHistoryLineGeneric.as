package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.icons.SymbolIconDeleteGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildArtifactGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildBattleAttackGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildBattleDefenseGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildHonorGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildImprovementSmallGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildMissileSmallGeneric;
   
   public class SymbolGuildBattleHistoryLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildBattleHistoryLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var txtEnemyName:ILabelArea = null;
      
      public var txtDate:ILabelArea = null;
      
      public var txtJoined:ILabelArea = null;
      
      public var txtStatusWon:ILabelArea = null;
      
      public var txtStatusLost:ILabelArea = null;
      
      public var txtHonor:ILabelArea = null;
      
      public var iconGuildMissiles:SymbolIconGuildMissileSmallGeneric = null;
      
      public var iconArtifact:SymbolIconGuildArtifactGeneric = null;
      
      public var iconArtifactStolen:SymbolIconDeleteGeneric = null;
      
      public var iconImprovement:SymbolIconGuildImprovementSmallGeneric = null;
      
      public var iconHonor:SymbolIconGuildHonorGeneric = null;
      
      public var iconAttack:SymbolIconGuildBattleAttackGeneric = null;
      
      public var iconDefense:SymbolIconGuildBattleDefenseGeneric = null;
      
      public var emblem:SymbolGuildEmblemGeneric = null;
      
      public function SymbolGuildBattleHistoryLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildBattleHistoryLine;
         }
         else
         {
            _nativeObject = new SymbolGuildBattleHistoryLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         txtEnemyName = FlashLabelArea.fromNative(_nativeObject.txtEnemyName);
         txtDate = FlashLabelArea.fromNative(_nativeObject.txtDate);
         txtJoined = FlashLabelArea.fromNative(_nativeObject.txtJoined);
         txtStatusWon = FlashLabelArea.fromNative(_nativeObject.txtStatusWon);
         txtStatusLost = FlashLabelArea.fromNative(_nativeObject.txtStatusLost);
         txtHonor = FlashLabelArea.fromNative(_nativeObject.txtHonor);
         iconGuildMissiles = new SymbolIconGuildMissileSmallGeneric(_nativeObject.iconGuildMissiles);
         iconArtifact = new SymbolIconGuildArtifactGeneric(_nativeObject.iconArtifact);
         iconArtifactStolen = new SymbolIconDeleteGeneric(_nativeObject.iconArtifactStolen);
         iconImprovement = new SymbolIconGuildImprovementSmallGeneric(_nativeObject.iconImprovement);
         iconHonor = new SymbolIconGuildHonorGeneric(_nativeObject.iconHonor);
         iconAttack = new SymbolIconGuildBattleAttackGeneric(_nativeObject.iconAttack);
         iconDefense = new SymbolIconGuildBattleDefenseGeneric(_nativeObject.iconDefense);
         emblem = new SymbolGuildEmblemGeneric(_nativeObject.emblem);
      }
      
      public function setNativeInstance(param1:SymbolGuildBattleHistoryLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         FlashLabelArea.setNativeInstance(txtEnemyName,_nativeObject.txtEnemyName);
         FlashLabelArea.setNativeInstance(txtDate,_nativeObject.txtDate);
         FlashLabelArea.setNativeInstance(txtJoined,_nativeObject.txtJoined);
         FlashLabelArea.setNativeInstance(txtStatusWon,_nativeObject.txtStatusWon);
         FlashLabelArea.setNativeInstance(txtStatusLost,_nativeObject.txtStatusLost);
         FlashLabelArea.setNativeInstance(txtHonor,_nativeObject.txtHonor);
         if(_nativeObject.iconGuildMissiles)
         {
            iconGuildMissiles.setNativeInstance(_nativeObject.iconGuildMissiles);
         }
         if(_nativeObject.iconArtifact)
         {
            iconArtifact.setNativeInstance(_nativeObject.iconArtifact);
         }
         if(_nativeObject.iconArtifactStolen)
         {
            iconArtifactStolen.setNativeInstance(_nativeObject.iconArtifactStolen);
         }
         if(_nativeObject.iconImprovement)
         {
            iconImprovement.setNativeInstance(_nativeObject.iconImprovement);
         }
         if(_nativeObject.iconHonor)
         {
            iconHonor.setNativeInstance(_nativeObject.iconHonor);
         }
         if(_nativeObject.iconAttack)
         {
            iconAttack.setNativeInstance(_nativeObject.iconAttack);
         }
         if(_nativeObject.iconDefense)
         {
            iconDefense.setNativeInstance(_nativeObject.iconDefense);
         }
         if(_nativeObject.emblem)
         {
            emblem.setNativeInstance(_nativeObject.emblem);
         }
      }
   }
}
