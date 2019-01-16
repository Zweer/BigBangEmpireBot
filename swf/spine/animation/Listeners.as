package spine.animation
{
   public class Listeners
   {
       
      
      private var _listeners:Vector.<Function>;
      
      public function Listeners()
      {
         _listeners = new Vector.<Function>();
         super();
      }
      
      public function get listeners() : Vector.<Function>
      {
         return _listeners;
      }
      
      public function add(param1:Function) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("listener cannot be null.");
         }
         var _loc2_:int = _listeners.indexOf(param1);
         if(_loc2_ == -1)
         {
            _listeners[_listeners.length] = param1;
         }
      }
      
      public function remove(param1:Function) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("listener cannot be null.");
         }
         var _loc2_:int = _listeners.indexOf(param1);
         if(_loc2_ != -1)
         {
            _listeners.splice(_listeners.indexOf(param1),1);
         }
      }
      
      public function invoke(... rest) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = _listeners;
         for each(var _loc2_ in _listeners)
         {
            _loc2_.apply(null,rest);
         }
      }
   }
}
