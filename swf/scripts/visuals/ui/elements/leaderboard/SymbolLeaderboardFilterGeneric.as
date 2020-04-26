package visuals.ui.elements.leaderboard
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolServerSelectionGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.goal.SymbolIconSaveFilterGeneric;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   
   public class SymbolLeaderboardFilterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardFilter = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var ckbThisServer:SymbolUiCheckboxGeneric = null;
      
      public var txtThisServer:ILabelArea = null;
      
      public var ckbOtherServer:SymbolUiCheckboxGeneric = null;
      
      public var txtOtherServer:ILabelArea = null;
      
      public var ckbGlobal:SymbolUiCheckboxGeneric = null;
      
      public var txtGlobal:ILabelArea = null;
      
      public var btnSaveSettings:SymbolIconSaveFilterGeneric = null;
      
      public var txtRefreshInfo:ILabelArea = null;
      
      public var iconRefreshInfo:SymbolIconExclamationMarkGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtCaptionServer:ILabelArea = null;
      
      public var txtSelectedServer:ILabelArea = null;
      
      public var serverSelection:SymbolServerSelectionGeneric = null;
      
      public function SymbolLeaderboardFilterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardFilter;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardFilter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         ckbThisServer = new SymbolUiCheckboxGeneric(_nativeObject.ckbThisServer);
         txtThisServer = FlashLabelArea.fromNative(_nativeObject.txtThisServer);
         ckbOtherServer = new SymbolUiCheckboxGeneric(_nativeObject.ckbOtherServer);
         txtOtherServer = FlashLabelArea.fromNative(_nativeObject.txtOtherServer);
         ckbGlobal = new SymbolUiCheckboxGeneric(_nativeObject.ckbGlobal);
         txtGlobal = FlashLabelArea.fromNative(_nativeObject.txtGlobal);
         btnSaveSettings = new SymbolIconSaveFilterGeneric(_nativeObject.btnSaveSettings);
         txtRefreshInfo = FlashLabelArea.fromNative(_nativeObject.txtRefreshInfo);
         iconRefreshInfo = new SymbolIconExclamationMarkGeneric(_nativeObject.iconRefreshInfo);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtCaptionServer = FlashLabelArea.fromNative(_nativeObject.txtCaptionServer);
         txtSelectedServer = FlashLabelArea.fromNative(_nativeObject.txtSelectedServer);
         serverSelection = new SymbolServerSelectionGeneric(_nativeObject.serverSelection);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardFilter) : void
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
         if(_nativeObject.ckbThisServer)
         {
            ckbThisServer.setNativeInstance(_nativeObject.ckbThisServer);
         }
         FlashLabelArea.setNativeInstance(txtThisServer,_nativeObject.txtThisServer);
         if(_nativeObject.ckbOtherServer)
         {
            ckbOtherServer.setNativeInstance(_nativeObject.ckbOtherServer);
         }
         FlashLabelArea.setNativeInstance(txtOtherServer,_nativeObject.txtOtherServer);
         if(_nativeObject.ckbGlobal)
         {
            ckbGlobal.setNativeInstance(_nativeObject.ckbGlobal);
         }
         FlashLabelArea.setNativeInstance(txtGlobal,_nativeObject.txtGlobal);
         if(_nativeObject.btnSaveSettings)
         {
            btnSaveSettings.setNativeInstance(_nativeObject.btnSaveSettings);
         }
         FlashLabelArea.setNativeInstance(txtRefreshInfo,_nativeObject.txtRefreshInfo);
         if(_nativeObject.iconRefreshInfo)
         {
            iconRefreshInfo.setNativeInstance(_nativeObject.iconRefreshInfo);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabelArea.setNativeInstance(txtCaptionServer,_nativeObject.txtCaptionServer);
         FlashLabelArea.setNativeInstance(txtSelectedServer,_nativeObject.txtSelectedServer);
         if(_nativeObject.serverSelection)
         {
            serverSelection.setNativeInstance(_nativeObject.serverSelection);
         }
      }
   }
}
