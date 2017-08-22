<nav class="gnb">
			<ul>
				<li loop="$GNB->list=>$key1,$val1" class="active"|cond="$val1['selected']">
					<a href="{$val1['href']}" target="_blank"|cond="$val1['open_window']=='Y'">{$val1['link']}</a>
					<!-- <ul cond="$val1['list']">
						<li loop="$val1['list']=>$key2,$val2" class="active"|cond="$val2['selected']"><a href="{$val2['href']}" target="_blank"|cond="$val2['open_window']=='Y'">{$val2['link']}</a></li>
					</ul> -->
				</li>
			</ul>
		</nav>