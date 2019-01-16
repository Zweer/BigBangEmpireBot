package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildHonorGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildMembersGeneric;
   import visuals.ui.elements.icons.SymbolIconLevelStarGeneric;
   
   public class SymbolGuildBattleSearchLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildBattleSearchLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var txtLevel:ILabelArea = null;
      
      public var txtMemberCount:ILabelArea = null;
      
      public var txtHonor:ILabelArea = null;
      
      public var iconHonor:SymbolIconGuildHonorGeneric = null;
      
      public var iconLevel:SymbolIconLevelStarGeneric = null;
      
      public var iconMemberCount:SymbolIconGuildMembersGeneric = null;
      
      public var emblem:SymbolGuildEmblemGeneric = null;
      
      public var iconLocale:SymbolGuildEmblemGeneric = null;
      
      public var topLayer:SymbolDummyGeneric = null;
      
      public function SymbolGuildBattleSearchLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildBattleSearchLine;
         }
         else
         {
            _nativeObject = new SymbolGuildBattleSearchLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         txtLevel = FlashLabelArea.fromNative(_nativeObject.txtLevel);
         txtMemberCount = FlashLabelArea.fromNative(_nativeObject.txtMemberCount);
         txtHonor = FlashLabelArea.fromNative(_nativeObject.txtHonor);
         iconHonor = new SymbolIconGuildHonorGeneric(_nativeObject.iconHonor);
         iconLevel = new SymbolIconLevelStarGeneric(_nativeObject.iconLevel);
         iconMemberCount = new SymbolIconGuildMembersGeneric(_nativeObject.iconMemberCount);
         emblem = new SymbolGuildEmblemGeneric(_nativeObject.emblem);
         iconLocale = new SymbolGuildEmblemGeneric(_nativeObject.iconLocale);
         topLayer = new SymbolDummyGeneric(_nativeObject.topLayer);
      }
      
      public function setNativeInstance(param1:SymbolGuildBattleSearchLine) : void
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
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtLevel,_nativeObject.txtLevel);
         FlashLabelArea.setNativeInstance(txtMemberCount,_nativeObject.txtMemberCount);
         FlashLabelArea.setNativeInstance(txtHonor,_nativeObject.txtHonor);
         if(_nativeObject.iconHonor)
         {
            iconHonor.setNativeInstance(_nativeObject.iconHonor);
         }
         if(_nativeObject.iconLevel)
         {
            iconLevel.setNativeInstance(_nativeObject.iconLevel);
         }
         if(_nativeObject.iconMemberCount)
         {
            iconMemberCount.setNativeInstance(_nativeObject.iconMemberCount);
         }
         if(_nativeObject.emblem)
         {
            emblem.setNativeInstance(_nativeObject.emblem);
         }
         if(_nativeObject.iconLocale)
         {
            iconLocale.setNativeInstance(_nativeObject.iconLocale);
         }
         if(_nativeObject.topLayer)
         {
            topLayer.setNativeInstance(_nativeObject.topLayer);
         }
      }
   }
}
