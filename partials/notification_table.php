<div class="panel panel-default">
    <div class="panel-body">
        <?php
			$notifs = get_notifications($_GET['outlet_id']);

			if(sizeof($notifs) < 1){
				//no notifications;
				?>
				<div class="jumbotron">
					<div class="container">
						<h1>No notifications.</h1>
					</div>
				</div>
		            <?php
			} else {
		?>
                <?php foreach($notifs['unread'] as $notif): ?>
                <div class="alert alert-info">
                    <label style="display:none" class="label label-<?=($notif['unread']) ? 'danger' : 'primary';?>">UNREAD</label>
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <strong><?=$notif['from_branch']['name'];?></strong> wants <?=$notif['quantity'];?>pc/s of <i><?=(is_object($notif['item'])) ? $notif['item']->title : "";?></i> from you.
                    <cite><?=$notif['timestamp'];?></cite>
                   <!-- <a href="#" id="markAsRead_<?=$notif['id'];?>" class="btn btn-default pull-right">Mark as Read</a> -->
                </div>
                <?php endforeach;?>
                <?php 
                if(isset($notifs['read'])):
	                foreach($notifs['read'] as $notif): ?>
	                <div class="alert alert-info">
	                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                    <strong><?=$notif['from_branch']['name'];?></strong> wants <?=$notif['quantity'];?>pc/s of <i><?=$notif['item']->title;?></i> from you.
	                    <cite><?=$notif['timestamp'];?></cite>
	                </div>
                <?php endforeach;endif; ?>
        <?php } ?>
    </div>
</div>
