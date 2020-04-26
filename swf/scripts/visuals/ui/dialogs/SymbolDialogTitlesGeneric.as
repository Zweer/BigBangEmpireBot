package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.titles.SymbolTitleLineGeneric;
   
   public class SymbolDialogTitlesGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogTitles = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var title1:SymbolTitleLineGeneric = null;
      
      public var title2:SymbolTitleLineGeneric = null;
      
      public var title3:SymbolTitleLineGeneric = null;
      
      public var title4:SymbolTitleLineGeneric = null;
      
      public var title5:SymbolTitleLineGeneric = null;
      
      public var title6:SymbolTitleLineGeneric = null;
      
      public var title7:SymbolTitleLineGeneric = null;
      
      public var title8:SymbolTitleLineGeneric = null;
      
      public var title9:SymbolTitleLineGeneric = null;
      
      public var title10:SymbolTitleLineGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtTitleCaption:ILabel = null;
      
      public var txtSourceCaption:ILabel = null;
      
      public var checkAvailableOnly:SymbolUiCheckboxGeneric = null;
      
      public var txtAvailableOnly:ILabelArea = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtNoTitles:ILabelArea = null;
      
      public var txtTitleInfo:ILabel = null;
      
      public function SymbolDialogTitlesGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogTitles;
         }
         else
         {
            _nativeObject = new SymbolDialogTitles();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         title1 = new SymbolTitleLineGeneric(_nativeObject.title1);
         title2 = new SymbolTitleLineGeneric(_nativeObject.title2);
         title3 = new SymbolTitleLineGeneric(_nativeObject.title3);
         title4 = new SymbolTitleLineGeneric(_nativeObject.title4);
         title5 = new SymbolTitleLineGeneric(_nativeObject.title5);
         title6 = new SymbolTitleLineGeneric(_nativeObject.title6);
         title7 = new SymbolTitleLineGeneric(_nativeObject.title7);
         title8 = new SymbolTitleLineGeneric(_nativeObject.title8);
         title9 = new SymbolTitleLineGeneric(_nativeObject.title9);
         title10 = new SymbolTitleLineGeneric(_nativeObject.title10);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtTitleCaption = FlashLabel.fromNative(_nativeObject.txtTitleCaption);
         txtSourceCaption = FlashLabel.fromNative(_nativeObject.txtSourceCaption);
         checkAvailableOnly = new SymbolUiCheckboxGeneric(_nativeObject.checkAvailableOnly);
         txtAvailableOnly = FlashLabelArea.fromNative(_nativeObject.txtAvailableOnly);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtNoTitles = FlashLabelArea.fromNative(_nativeObject.txtNoTitles);
         txtTitleInfo = FlashLabel.fromNative(_nativeObject.txtTitleInfo);
      }
      
      public function setNativeInstance(param1:SymbolDialogTitles) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.title1)
         {
            title1.setNativeInstance(_nativeObject.title1);
         }
         if(_nativeObject.title2)
         {
            title2.setNativeInstance(_nativeObject.title2);
         }
         if(_nativeObject.title3)
         {
            title3.setNativeInstance(_nativeObject.title3);
         }
         if(_nativeObject.title4)
         {
            title4.setNativeInstance(_nativeObject.title4);
         }
         if(_nativeObject.title5)
         {
            title5.setNativeInstance(_nativeObject.title5);
         }
         if(_nativeObject.title6)
         {
            title6.setNativeInstance(_nativeObject.title6);
         }
         if(_nativeObject.title7)
         {
            title7.setNativeInstance(_nativeObject.title7);
         }
         if(_nativeObject.title8)
         {
            title8.setNativeInstance(_nativeObject.title8);
         }
         if(_nativeObject.title9)
         {
            title9.setNativeInstance(_nativeObject.title9);
         }
         if(_nativeObject.title10)
         {
            title10.setNativeInstance(_nativeObject.title10);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabel.setNativeInstance(txtTitleCaption,_nativeObject.txtTitleCaption);
         FlashLabel.setNativeInstance(txtSourceCaption,_nativeObject.txtSourceCaption);
         if(_nativeObject.checkAvailableOnly)
         {
            checkAvailableOnly.setNativeInstance(_nativeObject.checkAvailableOnly);
         }
         FlashLabelArea.setNativeInstance(txtAvailableOnly,_nativeObject.txtAvailableOnly);
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtNoTitles,_nativeObject.txtNoTitles);
         FlashLabel.setNativeInstance(txtTitleInfo,_nativeObject.txtTitleInfo);
      }
   }
}
