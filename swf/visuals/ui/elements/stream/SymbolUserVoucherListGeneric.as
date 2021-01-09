package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolUserVoucherListGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUserVoucherList = null;
      
      public var line1:SymbolUserVoucherLineGeneric = null;
      
      public var line2:SymbolUserVoucherLineGeneric = null;
      
      public var line3:SymbolUserVoucherLineGeneric = null;
      
      public var line4:SymbolUserVoucherLineGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var txtNoUserVouchers:ILabelArea = null;
      
      public function SymbolUserVoucherListGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUserVoucherList;
         }
         else
         {
            _nativeObject = new SymbolUserVoucherList();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolUserVoucherLineGeneric(_nativeObject.line1);
         line2 = new SymbolUserVoucherLineGeneric(_nativeObject.line2);
         line3 = new SymbolUserVoucherLineGeneric(_nativeObject.line3);
         line4 = new SymbolUserVoucherLineGeneric(_nativeObject.line4);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         txtNoUserVouchers = FlashLabelArea.fromNative(_nativeObject.txtNoUserVouchers);
      }
      
      public function setNativeInstance(param1:SymbolUserVoucherList) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
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
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         FlashLabelArea.setNativeInstance(txtNoUserVouchers,_nativeObject.txtNoUserVouchers);
      }
   }
}
