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
   import visuals.ui.elements.icons.SymbolIconLevelStarGeneric;
   
   public class SymbolGuildLeaderVoteLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildLeaderVoteLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var txtRank:ILabelArea = null;
      
      public var txtLevel:ILabelArea = null;
      
      public var iconLevel:SymbolIconLevelStarGeneric = null;
      
      public function SymbolGuildLeaderVoteLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildLeaderVoteLine;
         }
         else
         {
            _nativeObject = new SymbolGuildLeaderVoteLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         txtRank = FlashLabelArea.fromNative(_nativeObject.txtRank);
         txtLevel = FlashLabelArea.fromNative(_nativeObject.txtLevel);
         iconLevel = new SymbolIconLevelStarGeneric(_nativeObject.iconLevel);
      }
      
      public function setNativeInstance(param1:SymbolGuildLeaderVoteLine) : void
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
         FlashLabelArea.setNativeInstance(txtRank,_nativeObject.txtRank);
         FlashLabelArea.setNativeInstance(txtLevel,_nativeObject.txtLevel);
         if(_nativeObject.iconLevel)
         {
            iconLevel.setNativeInstance(_nativeObject.iconLevel);
         }
      }
   }
}
