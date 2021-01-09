package visuals.ui.elements.sewing_machine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.generic.SymbolIconCommonGeneric;
   import visuals.ui.elements.generic.SymbolIconEpicGeneric;
   import visuals.ui.elements.generic.SymbolIconRareGeneric;
   import visuals.ui.elements.goal.SymbolIconSaveFilterGeneric;
   import visuals.ui.elements.movie.SymbolBackgroundMovieRewardTooltipGeneric;
   
   public class SymbolSewingMachineFilterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSewingMachineFilter = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var bg:SymbolBackgroundMovieRewardTooltipGeneric = null;
      
      public var btnSaveSettings:SymbolIconSaveFilterGeneric = null;
      
      public var ckbShowEventItem:SymbolUiCheckboxGeneric = null;
      
      public var txtShowEventItem:ILabelArea = null;
      
      public var ckbShowStoryDungeonItem:SymbolUiCheckboxGeneric = null;
      
      public var txtShowStoryDungeonItem:ILabelArea = null;
      
      public var ckbShowOtherItem:SymbolUiCheckboxGeneric = null;
      
      public var txtShowOtherItem:ILabelArea = null;
      
      public var ckbShowCommon:SymbolUiCheckboxGeneric = null;
      
      public var txtShowCommon:ILabelArea = null;
      
      public var ckbShowRare:SymbolUiCheckboxGeneric = null;
      
      public var txtShowRare:ILabelArea = null;
      
      public var ckbShowEpic:SymbolUiCheckboxGeneric = null;
      
      public var txtShowEpic:ILabelArea = null;
      
      public var iconShowCommon:SymbolIconCommonGeneric = null;
      
      public var iconShowRare:SymbolIconRareGeneric = null;
      
      public var iconShowEpic:SymbolIconEpicGeneric = null;
      
      public var inputSearch:ITextInput = null;
      
      public function SymbolSewingMachineFilterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSewingMachineFilter;
         }
         else
         {
            _nativeObject = new SymbolSewingMachineFilter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         bg = new SymbolBackgroundMovieRewardTooltipGeneric(_nativeObject.bg);
         btnSaveSettings = new SymbolIconSaveFilterGeneric(_nativeObject.btnSaveSettings);
         ckbShowEventItem = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowEventItem);
         txtShowEventItem = FlashLabelArea.fromNative(_nativeObject.txtShowEventItem);
         ckbShowStoryDungeonItem = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowStoryDungeonItem);
         txtShowStoryDungeonItem = FlashLabelArea.fromNative(_nativeObject.txtShowStoryDungeonItem);
         ckbShowOtherItem = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowOtherItem);
         txtShowOtherItem = FlashLabelArea.fromNative(_nativeObject.txtShowOtherItem);
         ckbShowCommon = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowCommon);
         txtShowCommon = FlashLabelArea.fromNative(_nativeObject.txtShowCommon);
         ckbShowRare = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowRare);
         txtShowRare = FlashLabelArea.fromNative(_nativeObject.txtShowRare);
         ckbShowEpic = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowEpic);
         txtShowEpic = FlashLabelArea.fromNative(_nativeObject.txtShowEpic);
         iconShowCommon = new SymbolIconCommonGeneric(_nativeObject.iconShowCommon);
         iconShowRare = new SymbolIconRareGeneric(_nativeObject.iconShowRare);
         iconShowEpic = new SymbolIconEpicGeneric(_nativeObject.iconShowEpic);
         inputSearch = FlashTextInput.fromNative(_nativeObject.inputSearch);
      }
      
      public function setNativeInstance(param1:SymbolSewingMachineFilter) : void
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
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.btnSaveSettings)
         {
            btnSaveSettings.setNativeInstance(_nativeObject.btnSaveSettings);
         }
         if(_nativeObject.ckbShowEventItem)
         {
            ckbShowEventItem.setNativeInstance(_nativeObject.ckbShowEventItem);
         }
         FlashLabelArea.setNativeInstance(txtShowEventItem,_nativeObject.txtShowEventItem);
         if(_nativeObject.ckbShowStoryDungeonItem)
         {
            ckbShowStoryDungeonItem.setNativeInstance(_nativeObject.ckbShowStoryDungeonItem);
         }
         FlashLabelArea.setNativeInstance(txtShowStoryDungeonItem,_nativeObject.txtShowStoryDungeonItem);
         if(_nativeObject.ckbShowOtherItem)
         {
            ckbShowOtherItem.setNativeInstance(_nativeObject.ckbShowOtherItem);
         }
         FlashLabelArea.setNativeInstance(txtShowOtherItem,_nativeObject.txtShowOtherItem);
         if(_nativeObject.ckbShowCommon)
         {
            ckbShowCommon.setNativeInstance(_nativeObject.ckbShowCommon);
         }
         FlashLabelArea.setNativeInstance(txtShowCommon,_nativeObject.txtShowCommon);
         if(_nativeObject.ckbShowRare)
         {
            ckbShowRare.setNativeInstance(_nativeObject.ckbShowRare);
         }
         FlashLabelArea.setNativeInstance(txtShowRare,_nativeObject.txtShowRare);
         if(_nativeObject.ckbShowEpic)
         {
            ckbShowEpic.setNativeInstance(_nativeObject.ckbShowEpic);
         }
         FlashLabelArea.setNativeInstance(txtShowEpic,_nativeObject.txtShowEpic);
         if(_nativeObject.iconShowCommon)
         {
            iconShowCommon.setNativeInstance(_nativeObject.iconShowCommon);
         }
         if(_nativeObject.iconShowRare)
         {
            iconShowRare.setNativeInstance(_nativeObject.iconShowRare);
         }
         if(_nativeObject.iconShowEpic)
         {
            iconShowEpic.setNativeInstance(_nativeObject.iconShowEpic);
         }
         FlashTextInput.setNativeInstance(inputSearch,_nativeObject.inputSearch);
      }
   }
}
