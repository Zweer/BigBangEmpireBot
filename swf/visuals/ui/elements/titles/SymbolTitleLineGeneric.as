package visuals.ui.elements.titles
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxCheckedGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.buttons.SymbolButtonShopGeneric;
   import visuals.ui.elements.event.SymbolIconEventGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   import visuals.ui.elements.leaderboard.SymbolIconMovieTournamentGeneric;
   import visuals.ui.elements.sewing_machine.SymbolIconItemPatternGeneric;
   
   public class SymbolTitleLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTitleLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var txtSource:ILabelArea = null;
      
      public var iconNew:SymbolIconExclamationMarkGeneric = null;
      
      public var movieTournament:SymbolIconMovieTournamentGeneric = null;
      
      public var shop:SymbolButtonShopGeneric = null;
      
      public var goal:SymbolIconGoalGeneric = null;
      
      public var checked:SymbolUiCheckboxCheckedGeneric = null;
      
      public var checkbox:SymbolUiCheckboxGeneric = null;
      
      public var secret:SymbolIconSecretGeneric = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public var itemPattern:SymbolIconItemPatternGeneric = null;
      
      public var eventQuest:SymbolIconEventGeneric = null;
      
      public function SymbolTitleLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTitleLine;
         }
         else
         {
            _nativeObject = new SymbolTitleLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         txtSource = FlashLabelArea.fromNative(_nativeObject.txtSource);
         iconNew = new SymbolIconExclamationMarkGeneric(_nativeObject.iconNew);
         movieTournament = new SymbolIconMovieTournamentGeneric(_nativeObject.movieTournament);
         shop = new SymbolButtonShopGeneric(_nativeObject.shop);
         goal = new SymbolIconGoalGeneric(_nativeObject.goal);
         checked = new SymbolUiCheckboxCheckedGeneric(_nativeObject.checked);
         checkbox = new SymbolUiCheckboxGeneric(_nativeObject.checkbox);
         secret = new SymbolIconSecretGeneric(_nativeObject.secret);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
         itemPattern = new SymbolIconItemPatternGeneric(_nativeObject.itemPattern);
         eventQuest = new SymbolIconEventGeneric(_nativeObject.eventQuest);
      }
      
      public function setNativeInstance(param1:SymbolTitleLine) : void
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
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         FlashLabelArea.setNativeInstance(txtSource,_nativeObject.txtSource);
         if(_nativeObject.iconNew)
         {
            iconNew.setNativeInstance(_nativeObject.iconNew);
         }
         if(_nativeObject.movieTournament)
         {
            movieTournament.setNativeInstance(_nativeObject.movieTournament);
         }
         if(_nativeObject.shop)
         {
            shop.setNativeInstance(_nativeObject.shop);
         }
         if(_nativeObject.goal)
         {
            goal.setNativeInstance(_nativeObject.goal);
         }
         if(_nativeObject.checked)
         {
            checked.setNativeInstance(_nativeObject.checked);
         }
         if(_nativeObject.checkbox)
         {
            checkbox.setNativeInstance(_nativeObject.checkbox);
         }
         if(_nativeObject.secret)
         {
            secret.setNativeInstance(_nativeObject.secret);
         }
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         if(_nativeObject.itemPattern)
         {
            itemPattern.setNativeInstance(_nativeObject.itemPattern);
         }
         if(_nativeObject.eventQuest)
         {
            eventQuest.setNativeInstance(_nativeObject.eventQuest);
         }
      }
   }
}
