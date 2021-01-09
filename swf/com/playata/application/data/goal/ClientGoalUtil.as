package com.playata.application.data.goal
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import flash.display.Stage;
   import flash.events.Event;
   
   public class ClientGoalUtil
   {
      
      private static const GOAL_MAPPING:Object = {"ACHIEVEMENT_BIRDS":{
         "identifier":"birds_killed",
         "value":1
      }};
       
      
      private var _instance:ClientGoalUtil;
      
      private var _stage:Stage;
      
      public function ClientGoalUtil(param1:Stage)
      {
         super();
         _stage = param1;
         _stage.addEventListener("ACHIEVEMENT_BIRDS",handleGoalTriggered);
         _instance = this;
      }
      
      public function dispose() : void
      {
         _stage.removeEventListener("ACHIEVEMENT_BIRDS",handleGoalTriggered);
      }
      
      private function handleGoalTriggered(param1:Event) : void
      {
         if(!GOAL_MAPPING.hasOwnProperty(param1.type))
         {
            return;
         }
         var _loc2_:String = GOAL_MAPPING[param1.type].identifier;
         var _loc3_:int = GOAL_MAPPING[param1.type].value;
         triggerGoalComplete(_loc2_,_loc3_);
      }
      
      public function triggerGoalComplete(param1:String, param2:int) : void
      {
         Environment.application.sendActionRequest("completeClientGoal",{
            "identifier":param1,
            "value":param2
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("completeClientGoal" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      public function get instance() : ClientGoalUtil
      {
         return _instance;
      }
   }
}
