package visuals.ui.elements.resource_request
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
   import visuals.ui.base.SymbolTextfieldVeryWideGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolResourceRequestFriendContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolResourceRequestFriendContent = null;
      
      public var btnSend:SymbolUiButtonDefaultGeneric = null;
      
      public var line1:SymbolResourceRequestFriendLineGeneric = null;
      
      public var line2:SymbolResourceRequestFriendLineGeneric = null;
      
      public var line3:SymbolResourceRequestFriendLineGeneric = null;
      
      public var line4:SymbolResourceRequestFriendLineGeneric = null;
      
      public var line5:SymbolResourceRequestFriendLineGeneric = null;
      
      public var line6:SymbolResourceRequestFriendLineGeneric = null;
      
      public var line7:SymbolResourceRequestFriendLineGeneric = null;
      
      public var line8:SymbolResourceRequestFriendLineGeneric = null;
      
      public var line9:SymbolResourceRequestFriendLineGeneric = null;
      
      public var line10:SymbolResourceRequestFriendLineGeneric = null;
      
      public var txtSearch:SymbolTextfieldVeryWideGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var inputSearch:ITextInput = null;
      
      public var ckbSelectAll:SymbolUiCheckboxGeneric = null;
      
      public var txtSelectAll:ILabel = null;
      
      public var txtNoFriends:ILabelArea = null;
      
      public function SymbolResourceRequestFriendContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolResourceRequestFriendContent;
         }
         else
         {
            _nativeObject = new SymbolResourceRequestFriendContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnSend = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSend);
         line1 = new SymbolResourceRequestFriendLineGeneric(_nativeObject.line1);
         line2 = new SymbolResourceRequestFriendLineGeneric(_nativeObject.line2);
         line3 = new SymbolResourceRequestFriendLineGeneric(_nativeObject.line3);
         line4 = new SymbolResourceRequestFriendLineGeneric(_nativeObject.line4);
         line5 = new SymbolResourceRequestFriendLineGeneric(_nativeObject.line5);
         line6 = new SymbolResourceRequestFriendLineGeneric(_nativeObject.line6);
         line7 = new SymbolResourceRequestFriendLineGeneric(_nativeObject.line7);
         line8 = new SymbolResourceRequestFriendLineGeneric(_nativeObject.line8);
         line9 = new SymbolResourceRequestFriendLineGeneric(_nativeObject.line9);
         line10 = new SymbolResourceRequestFriendLineGeneric(_nativeObject.line10);
         txtSearch = new SymbolTextfieldVeryWideGeneric(_nativeObject.txtSearch);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         inputSearch = FlashTextInput.fromNative(_nativeObject.inputSearch);
         ckbSelectAll = new SymbolUiCheckboxGeneric(_nativeObject.ckbSelectAll);
         txtSelectAll = FlashLabel.fromNative(_nativeObject.txtSelectAll);
         txtNoFriends = FlashLabelArea.fromNative(_nativeObject.txtNoFriends);
      }
      
      public function setNativeInstance(param1:SymbolResourceRequestFriendContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnSend)
         {
            btnSend.setNativeInstance(_nativeObject.btnSend);
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
         if(_nativeObject.txtSearch)
         {
            txtSearch.setNativeInstance(_nativeObject.txtSearch);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         FlashTextInput.setNativeInstance(inputSearch,_nativeObject.inputSearch);
         if(_nativeObject.ckbSelectAll)
         {
            ckbSelectAll.setNativeInstance(_nativeObject.ckbSelectAll);
         }
         FlashLabel.setNativeInstance(txtSelectAll,_nativeObject.txtSelectAll);
         FlashLabelArea.setNativeInstance(txtNoFriends,_nativeObject.txtNoFriends);
      }
   }
}
