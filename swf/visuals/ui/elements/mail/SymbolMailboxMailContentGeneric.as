package visuals.ui.elements.mail
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolIconButtonMessageDeleteAllGeneric;
   import visuals.ui.base.SymbolIconButtonMessageDeleteGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.generic.SymbolTextfieldBackgroundWideGeneric;
   
   public class SymbolMailboxMailContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMailboxMailContent = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var txtDateCaption:ILabel = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtSubjectCaption:ILabel = null;
      
      public var txtNoMessages:ILabelArea = null;
      
      public var btnRead:SymbolUiButtonDefaultGeneric = null;
      
      public var btnDelete:SymbolIconButtonMessageDeleteGeneric = null;
      
      public var btnDeleteAll:SymbolIconButtonMessageDeleteAllGeneric = null;
      
      public var btnComposeNew:SymbolButtonSendMessageTextGeneric = null;
      
      public var mail1:SymbolMailboxLineGeneric = null;
      
      public var mail2:SymbolMailboxLineGeneric = null;
      
      public var mail3:SymbolMailboxLineGeneric = null;
      
      public var mail4:SymbolMailboxLineGeneric = null;
      
      public var mail5:SymbolMailboxLineGeneric = null;
      
      public var mail6:SymbolMailboxLineGeneric = null;
      
      public var mail7:SymbolMailboxLineGeneric = null;
      
      public var mail8:SymbolMailboxLineGeneric = null;
      
      public var mail9:SymbolMailboxLineGeneric = null;
      
      public var mail10:SymbolMailboxLineGeneric = null;
      
      public var mail11:SymbolMailboxLineGeneric = null;
      
      public var filterBackground:SymbolTextfieldBackgroundWideGeneric = null;
      
      public var inputFilter:ITextInput = null;
      
      public function SymbolMailboxMailContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMailboxMailContent;
         }
         else
         {
            _nativeObject = new SymbolMailboxMailContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         txtDateCaption = FlashLabel.fromNative(_nativeObject.txtDateCaption);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtSubjectCaption = FlashLabel.fromNative(_nativeObject.txtSubjectCaption);
         txtNoMessages = FlashLabelArea.fromNative(_nativeObject.txtNoMessages);
         btnRead = new SymbolUiButtonDefaultGeneric(_nativeObject.btnRead);
         btnDelete = new SymbolIconButtonMessageDeleteGeneric(_nativeObject.btnDelete);
         btnDeleteAll = new SymbolIconButtonMessageDeleteAllGeneric(_nativeObject.btnDeleteAll);
         btnComposeNew = new SymbolButtonSendMessageTextGeneric(_nativeObject.btnComposeNew);
         mail1 = new SymbolMailboxLineGeneric(_nativeObject.mail1);
         mail2 = new SymbolMailboxLineGeneric(_nativeObject.mail2);
         mail3 = new SymbolMailboxLineGeneric(_nativeObject.mail3);
         mail4 = new SymbolMailboxLineGeneric(_nativeObject.mail4);
         mail5 = new SymbolMailboxLineGeneric(_nativeObject.mail5);
         mail6 = new SymbolMailboxLineGeneric(_nativeObject.mail6);
         mail7 = new SymbolMailboxLineGeneric(_nativeObject.mail7);
         mail8 = new SymbolMailboxLineGeneric(_nativeObject.mail8);
         mail9 = new SymbolMailboxLineGeneric(_nativeObject.mail9);
         mail10 = new SymbolMailboxLineGeneric(_nativeObject.mail10);
         mail11 = new SymbolMailboxLineGeneric(_nativeObject.mail11);
         filterBackground = new SymbolTextfieldBackgroundWideGeneric(_nativeObject.filterBackground);
         inputFilter = FlashTextInput.fromNative(_nativeObject.inputFilter);
      }
      
      public function setNativeInstance(param1:SymbolMailboxMailContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         FlashLabel.setNativeInstance(txtDateCaption,_nativeObject.txtDateCaption);
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabel.setNativeInstance(txtSubjectCaption,_nativeObject.txtSubjectCaption);
         FlashLabelArea.setNativeInstance(txtNoMessages,_nativeObject.txtNoMessages);
         if(_nativeObject.btnRead)
         {
            btnRead.setNativeInstance(_nativeObject.btnRead);
         }
         if(_nativeObject.btnDelete)
         {
            btnDelete.setNativeInstance(_nativeObject.btnDelete);
         }
         if(_nativeObject.btnDeleteAll)
         {
            btnDeleteAll.setNativeInstance(_nativeObject.btnDeleteAll);
         }
         if(_nativeObject.btnComposeNew)
         {
            btnComposeNew.setNativeInstance(_nativeObject.btnComposeNew);
         }
         if(_nativeObject.mail1)
         {
            mail1.setNativeInstance(_nativeObject.mail1);
         }
         if(_nativeObject.mail2)
         {
            mail2.setNativeInstance(_nativeObject.mail2);
         }
         if(_nativeObject.mail3)
         {
            mail3.setNativeInstance(_nativeObject.mail3);
         }
         if(_nativeObject.mail4)
         {
            mail4.setNativeInstance(_nativeObject.mail4);
         }
         if(_nativeObject.mail5)
         {
            mail5.setNativeInstance(_nativeObject.mail5);
         }
         if(_nativeObject.mail6)
         {
            mail6.setNativeInstance(_nativeObject.mail6);
         }
         if(_nativeObject.mail7)
         {
            mail7.setNativeInstance(_nativeObject.mail7);
         }
         if(_nativeObject.mail8)
         {
            mail8.setNativeInstance(_nativeObject.mail8);
         }
         if(_nativeObject.mail9)
         {
            mail9.setNativeInstance(_nativeObject.mail9);
         }
         if(_nativeObject.mail10)
         {
            mail10.setNativeInstance(_nativeObject.mail10);
         }
         if(_nativeObject.mail11)
         {
            mail11.setNativeInstance(_nativeObject.mail11);
         }
         if(_nativeObject.filterBackground)
         {
            filterBackground.setNativeInstance(_nativeObject.filterBackground);
         }
         FlashTextInput.setNativeInstance(inputFilter,_nativeObject.inputFilter);
      }
   }
}
