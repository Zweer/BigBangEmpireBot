package visuals.ui.elements.leaderboard
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   import visuals.ui.elements.guild.SymbolIconGuildApplyNotOpenGeneric;
   import visuals.ui.elements.guild.SymbolIconGuildApplyOpenGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.icons.SymbolIconFlagGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildArtifactGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildBattleDefenseGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildHonorGeneric;
   
   public class SymbolLeaderboardGuildLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardGuildLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var txtRank:ILabel = null;
      
      public var txtGuildName:ILabelArea = null;
      
      public var txtServerId:ILabelArea = null;
      
      public var txtTotalPercentage:ILabelArea = null;
      
      public var txtFans:ILabelArea = null;
      
      public var txtHonor:ILabelArea = null;
      
      public var iconHonor:SymbolIconGuildHonorGeneric = null;
      
      public var iconLevel:SymbolIconFansGeneric = null;
      
      public var emblem:SymbolGuildEmblemGeneric = null;
      
      public var iconLocale:SymbolIconFlagGeneric = null;
      
      public var iconActiveGuildDefense:SymbolIconGuildBattleDefenseGeneric = null;
      
      public var iconGuildArtifact:SymbolIconGuildArtifactGeneric = null;
      
      public var iconNotOpen:SymbolIconGuildApplyNotOpenGeneric = null;
      
      public var iconOpen:SymbolIconGuildApplyOpenGeneric = null;
      
      public function SymbolLeaderboardGuildLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardGuildLine;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardGuildLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         txtRank = FlashLabel.fromNative(_nativeObject.txtRank);
         txtGuildName = FlashLabelArea.fromNative(_nativeObject.txtGuildName);
         txtServerId = FlashLabelArea.fromNative(_nativeObject.txtServerId);
         txtTotalPercentage = FlashLabelArea.fromNative(_nativeObject.txtTotalPercentage);
         txtFans = FlashLabelArea.fromNative(_nativeObject.txtFans);
         txtHonor = FlashLabelArea.fromNative(_nativeObject.txtHonor);
         iconHonor = new SymbolIconGuildHonorGeneric(_nativeObject.iconHonor);
         iconLevel = new SymbolIconFansGeneric(_nativeObject.iconLevel);
         emblem = new SymbolGuildEmblemGeneric(_nativeObject.emblem);
         iconLocale = new SymbolIconFlagGeneric(_nativeObject.iconLocale);
         iconActiveGuildDefense = new SymbolIconGuildBattleDefenseGeneric(_nativeObject.iconActiveGuildDefense);
         iconGuildArtifact = new SymbolIconGuildArtifactGeneric(_nativeObject.iconGuildArtifact);
         iconNotOpen = new SymbolIconGuildApplyNotOpenGeneric(_nativeObject.iconNotOpen);
         iconOpen = new SymbolIconGuildApplyOpenGeneric(_nativeObject.iconOpen);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardGuildLine) : void
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
         FlashLabel.setNativeInstance(txtRank,_nativeObject.txtRank);
         FlashLabelArea.setNativeInstance(txtGuildName,_nativeObject.txtGuildName);
         FlashLabelArea.setNativeInstance(txtServerId,_nativeObject.txtServerId);
         FlashLabelArea.setNativeInstance(txtTotalPercentage,_nativeObject.txtTotalPercentage);
         FlashLabelArea.setNativeInstance(txtFans,_nativeObject.txtFans);
         FlashLabelArea.setNativeInstance(txtHonor,_nativeObject.txtHonor);
         if(_nativeObject.iconHonor)
         {
            iconHonor.setNativeInstance(_nativeObject.iconHonor);
         }
         if(_nativeObject.iconLevel)
         {
            iconLevel.setNativeInstance(_nativeObject.iconLevel);
         }
         if(_nativeObject.emblem)
         {
            emblem.setNativeInstance(_nativeObject.emblem);
         }
         if(_nativeObject.iconLocale)
         {
            iconLocale.setNativeInstance(_nativeObject.iconLocale);
         }
         if(_nativeObject.iconActiveGuildDefense)
         {
            iconActiveGuildDefense.setNativeInstance(_nativeObject.iconActiveGuildDefense);
         }
         if(_nativeObject.iconGuildArtifact)
         {
            iconGuildArtifact.setNativeInstance(_nativeObject.iconGuildArtifact);
         }
         if(_nativeObject.iconNotOpen)
         {
            iconNotOpen.setNativeInstance(_nativeObject.iconNotOpen);
         }
         if(_nativeObject.iconOpen)
         {
            iconOpen.setNativeInstance(_nativeObject.iconOpen);
         }
      }
   }
}
