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
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiButtonMediumGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.guild.SymbolGuildSearchLineGeneric;
   
   public class SymbolDialogGuildSearchGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildSearch = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnView:SymbolUiButtonMediumGeneric = null;
      
      public var line1:SymbolGuildSearchLineGeneric = null;
      
      public var line2:SymbolGuildSearchLineGeneric = null;
      
      public var line3:SymbolGuildSearchLineGeneric = null;
      
      public var line4:SymbolGuildSearchLineGeneric = null;
      
      public var line5:SymbolGuildSearchLineGeneric = null;
      
      public var line6:SymbolGuildSearchLineGeneric = null;
      
      public var line7:SymbolGuildSearchLineGeneric = null;
      
      public var line8:SymbolGuildSearchLineGeneric = null;
      
      public var line9:SymbolGuildSearchLineGeneric = null;
      
      public var line10:SymbolGuildSearchLineGeneric = null;
      
      public var line11:SymbolGuildSearchLineGeneric = null;
      
      public var line12:SymbolGuildSearchLineGeneric = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtMembersCaption:ILabel = null;
      
      public var txtTotalPercentageCaption:ILabel = null;
      
      public var btnApply:SymbolUiButtonMediumGeneric = null;
      
      public var btnAllGuilds:SymbolUiButtonDefaultGeneric = null;
      
      public var txtNoGuilds:ILabelArea = null;
      
      public var btnTabOpen:SymbolButtonTabGeneric = null;
      
      public var btnTabNotOpen:SymbolButtonTabGeneric = null;
      
      public function SymbolDialogGuildSearchGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildSearch;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildSearch();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnView = new SymbolUiButtonMediumGeneric(_nativeObject.btnView);
         line1 = new SymbolGuildSearchLineGeneric(_nativeObject.line1);
         line2 = new SymbolGuildSearchLineGeneric(_nativeObject.line2);
         line3 = new SymbolGuildSearchLineGeneric(_nativeObject.line3);
         line4 = new SymbolGuildSearchLineGeneric(_nativeObject.line4);
         line5 = new SymbolGuildSearchLineGeneric(_nativeObject.line5);
         line6 = new SymbolGuildSearchLineGeneric(_nativeObject.line6);
         line7 = new SymbolGuildSearchLineGeneric(_nativeObject.line7);
         line8 = new SymbolGuildSearchLineGeneric(_nativeObject.line8);
         line9 = new SymbolGuildSearchLineGeneric(_nativeObject.line9);
         line10 = new SymbolGuildSearchLineGeneric(_nativeObject.line10);
         line11 = new SymbolGuildSearchLineGeneric(_nativeObject.line11);
         line12 = new SymbolGuildSearchLineGeneric(_nativeObject.line12);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtMembersCaption = FlashLabel.fromNative(_nativeObject.txtMembersCaption);
         txtTotalPercentageCaption = FlashLabel.fromNative(_nativeObject.txtTotalPercentageCaption);
         btnApply = new SymbolUiButtonMediumGeneric(_nativeObject.btnApply);
         btnAllGuilds = new SymbolUiButtonDefaultGeneric(_nativeObject.btnAllGuilds);
         txtNoGuilds = FlashLabelArea.fromNative(_nativeObject.txtNoGuilds);
         btnTabOpen = new SymbolButtonTabGeneric(_nativeObject.btnTabOpen);
         btnTabNotOpen = new SymbolButtonTabGeneric(_nativeObject.btnTabNotOpen);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildSearch) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnView)
         {
            btnView.setNativeInstance(_nativeObject.btnView);
         }
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.line6)
         {
            line6.setNativeInstance(_nativeObject.line6);
         }
         if(_nativeObject.line7)
         {
            line7.setNativeInstance(_nativeObject.line7);
         }
         if(_nativeObject.line8)
         {
            line8.setNativeInstance(_nativeObject.line8);
         }
         if(_nativeObject.line9)
         {
            line9.setNativeInstance(_nativeObject.line9);
         }
         if(_nativeObject.line10)
         {
            line10.setNativeInstance(_nativeObject.line10);
         }
         if(_nativeObject.line11)
         {
            line11.setNativeInstance(_nativeObject.line11);
         }
         if(_nativeObject.line12)
         {
            line12.setNativeInstance(_nativeObject.line12);
         }
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabel.setNativeInstance(txtMembersCaption,_nativeObject.txtMembersCaption);
         FlashLabel.setNativeInstance(txtTotalPercentageCaption,_nativeObject.txtTotalPercentageCaption);
         if(_nativeObject.btnApply)
         {
            btnApply.setNativeInstance(_nativeObject.btnApply);
         }
         if(_nativeObject.btnAllGuilds)
         {
            btnAllGuilds.setNativeInstance(_nativeObject.btnAllGuilds);
         }
         FlashLabelArea.setNativeInstance(txtNoGuilds,_nativeObject.txtNoGuilds);
         if(_nativeObject.btnTabOpen)
         {
            btnTabOpen.setNativeInstance(_nativeObject.btnTabOpen);
         }
         if(_nativeObject.btnTabNotOpen)
         {
            btnTabNotOpen.setNativeInstance(_nativeObject.btnTabNotOpen);
         }
      }
   }
}
